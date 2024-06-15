import 'dart:io';
import 'package:dentist/global/controller/generelController.dart';
import 'package:dentist/service/api_check.dart';
import 'package:dentist/service/api_client.dart';
import 'package:dentist/service/api_url.dart';
import 'package:dentist/service/socket_service.dart';
import 'package:dentist/utils/AppConst/app_const.dart';
import 'package:dentist/utils/ToastMsg/toast_message.dart';
import 'package:dentist/view/screens/message/Model/message_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class MessageController extends GetxController {

  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  ScrollController scrollController = ScrollController();
  GeneralController generalController = Get.find<GeneralController>();
  RxInt totalPage = 0.obs;
  RxInt currentPage = 0.obs;

RxBool isComment=false.obs;



  RxBool isChat = true.obs;
  RxDouble dragabbleHorizontal = 20.0.obs;
  RxDouble dragabbleVerticel = 100.0.obs;



  RxList<MessageDatum> messageList = <MessageDatum>[].obs;



  RxList selectedMembers = [].obs;



  void scrollToBottom() {
    if (scrollController.hasClients) {
      Future.delayed(Duration(milliseconds: 300), () {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      });
    }
  }




  listenToNewMsg(){
    ///========================= Listen to Socket =======================
    SocketApi.socket.on("message::${generalController.chatId.value}",(data){
      debugPrint("Socket Res=================>>>>>>>>>>>>>$data");

      MessageDatum newMsg = MessageDatum.fromJson(data);
      messageList.insert(0,newMsg);
      messageList.refresh();
      scrollToBottom();
      update();
    });
  }



  ///========================= Send Message =======================

  bool sendLoading=false;

  Rx<TextEditingController> sendController = TextEditingController().obs;

  sendMessage() async {

    // if (sendController.value.text.isEmpty ||
    //     generalController.imagePath.value.isEmpty){
    //
    //   return;
    // }
    //generalController.showPopUpLoader();

    Map<String,String> body = {
      "text":sendController.value.text.trimLeft(),
      "chatId":generalController.chatId.value,
    };

    if(sendController.value.text.trimLeft().isNotEmpty==true || generalController.imagePath.value.isNotEmpty==true){
      var response = generalController.imagePath.isEmpty
          ? await ApiClient.postData(ApiConstant.sendMessage,body)
          : await ApiClient.postMultipartData(ApiConstant.sendMessage,body,
          multipartBody: [
            MultipartBody("image",File(generalController.imagePath.value))
          ]);
      if (response.statusCode == 200){

        sendController.value.clear();
        generalController.imagePath.value ="";
         getMyChat();
        // var newMessage = MessageDatum.fromJson(response.body["data"]);
        // messageList.insert(0,newMessage);
        messageList.refresh(); // Refresh the UI
        scrollToBottom();// Refresh the UI
        update();

      } else {
        // navigator!.pop();
        ApiChecker.checkApi(response);
      }
    }
    else{
      toastMessage(message:"Please write something");
    }
  }
  ///<================================ Get my chat =============================>

 // RxList<MessageDatum> getMyChatModel = <MessageDatum>[].obs;

   getMyChat() async {
    var response = await ApiClient.getData("${ApiConstant.getMessage}${generalController.chatId.value}");
    if (response.statusCode == 200) {
      messageList.value = List<MessageDatum>.from(
          response.body["data"].map((x) => MessageDatum.fromJson(x)));
         refresh();
      // if (messageList.isNotEmpty) {
      //   currentPage.value = response.body['pagination']['page'];
      //   totalPage.value = response.body['pagination']['totalPage'];
      // }
      setRxRequestStatus(Status.completed);

    } else {
      if (response.statusText == ApiClient.noInternetMessage){
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);

    }
  }


  ///============================= Load More Data ============================

  //
  // var isLoadMoreRunning = false.obs;
  // RxInt page = 1.obs;
  //
  // loadMore() async {
  //   debugPrint("============== Load More Message ================");
  //   if (rxRequestStatus.value != Status.loading &&
  //       isLoadMoreRunning.value == false &&
  //       totalPage != currentPage) {
  //     isLoadMoreRunning(true);
  //     page.value += 1;
  //
  //     Response response = await ApiClient.getData(
  //       "${ApiConstant.getMessage}${generalController.chatId.value}?page=$page",
  //     );
  //     currentPage.value = response.body['pagination']['page'];
  //     totalPage.value = response.body['pagination']['totalPage'];
  //
  //     if (response.statusCode == 200) {
  //       var demoList = List<MessageDatum>.from(response.body["data"]
  //           .map((x) => MessageDatum.fromJson(x)));
  //       messageList.addAll(demoList);
  //       messageList.refresh();
  //       refresh();
  //     } else {
  //       ApiChecker.checkApi(response);
  //     }
  //     isLoadMoreRunning(false);
  //   }
  // }


  ///===================Pagination Scroll Controller===============

  Future<void> addScrollListener() async{
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      //loadMore();
    }
  }


  @override
  void onInit() {
  listenToNewMsg();
  getMyChat();
  scrollController.addListener(addScrollListener);
  super.onInit();
  }


}
