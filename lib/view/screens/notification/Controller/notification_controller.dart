import 'package:dentist/helper/shared_prefe/shared_prefe.dart';
import 'package:dentist/service/api_check.dart';
import 'package:dentist/service/api_client.dart';
import 'package:dentist/service/api_url.dart';
import 'package:dentist/service/socket_service.dart';
import 'package:dentist/utils/AppConst/app_const.dart';
import 'package:dentist/view/screens/home/controller/homecontroller.dart';
import 'package:dentist/view/screens/message/Model/message_model.dart';
import 'package:dentist/view/screens/notification/Model/notification_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class NotificationController extends GetxController{
  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

HomeController homeController=Get.find<HomeController>();


  RxInt totalPage = 0.obs;
  RxInt currentPage = 0.obs;


  ScrollController scrollController = ScrollController();

  // void scrollToBottom() {
  //   if (scrollController.hasClients) {
  //     Future.delayed(const Duration(milliseconds: 300), () {
  //       scrollController.jumpTo(scrollController.position.maxScrollExtent);
  //     });
  //   }
  // }


  RxInt unreadMessage=0.obs;
  RxList<NotificationDatum> notificationModel = <NotificationDatum>[].obs;

  ///========================= Listen to Socket =======================
  //
  // listenToNewNotification(){
  //   SocketApi.socket.on("patient-notifications",(data){
  //     debugPrint("Socket Res=================>>>>>>>>>>>>>$data");
  //     NotificationModel unreadNoti=NotificationModel.fromJson(data);
  //     NotificationDatum newNotification = NotificationDatum.fromJson(data);
  //     notificationModel.insert(0,newNotification);
  //     notificationModel.refresh();
  //     unreadMessage.value=unreadNoti.unreadNotifications!.toInt();
  //     unreadMessage.refresh();
  //     print("-===--=-=-=-=-=-=-=-=-=-=-= this is unread ${unreadNoti.unreadNotifications.toString()}");
  //     // scrollToBottom();
  //     update();
  //   });
  // }


  listenToNewNotification() {
    SocketApi.socket.on("patient-notifications", (data) {
      debugPrint("Socket Res=================>>>>>>>>>>>>>$data");

      try {
        // Check if data is not null
        if (data != null) {
          NotificationModel unreadNoti = NotificationModel.fromJson(data);
          NotificationDatum newNotification = NotificationDatum.fromJson(data);

          // Add the new notification to the list and refresh
          if (newNotification != null) {
            getNotification();
            notificationModel.insert(0, newNotification);
            notificationModel.refresh();
          }

          // Update unread message count if it is not null
          if (unreadNoti.unreadNotifications != null) {
            unreadMessage.value = unreadNoti.unreadNotifications!.toInt();
            unreadMessage.refresh();
            print("-===--=-=-=-=-=-=-=-=-=-=-= this is unread ${unreadNoti.unreadNotifications.toString()}");
          }
          update();
        } else {
          debugPrint("Received null data for patient-notifications");
        }
      } catch (e) {
        debugPrint("Error processing patient-notifications: $e");
      }
    });
  }

  ///<====================== This is for get notification ====================>

  getNotification()async{

    setRxRequestStatus(Status.loading);
    var response = await ApiClient.getData(ApiConstant.getNotification);
    if (response.statusCode == 200) {

      notificationModel.value = List<NotificationDatum>.from(
          response.body["data"].map((x) => NotificationDatum.fromJson(x)));
       unreadMessage.value=response.body["unreadNotifications"];
      if (notificationModel.isNotEmpty) {
        currentPage.value = response.body['pagination']['page'];
        totalPage.value = response.body['pagination']['totalPage'];
      }
       unreadMessage.refresh();
       print("===============-----------------==================---------------==== This is unread message${unreadMessage}");
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



  ///<====================== This is for read notification ===========>
  readNotification() async {
 //   profileUpdateLoading = true;
    var bearerToken =
    await SharePrefsHelper.getString(AppConstants.bearerToken);
    update();
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $bearerToken'
    };
    var body = {};
   var response= await ApiClient.patchData(
      headers: headers,
       ApiConstant.readNotification,
      body,
    );
    if (response.statusCode == 200){
       getNotification();
    } else {
      ApiChecker.checkApi(response);
    }
  }




  ///============================= Load More Data ============================

  var isLoadMoreRunning = false.obs;
  RxInt page = 1.obs;

  loadMore() async {
    debugPrint("============== Load More Message ================");
    if (rxRequestStatus.value != Status.loading &&
        isLoadMoreRunning.value == false &&
        totalPage != currentPage) {
      isLoadMoreRunning(true);
      page.value += 1;

      Response response = await ApiClient.getData(
        "${ApiConstant.getNotification}?page=$page",
      );
        currentPage.value = response.body['pagination']['page'] ?? 0;
        totalPage.value = response.body['pagination']['totalPage'] ?? 0;

      refresh();
      if (response.statusCode == 200){

        var demoList = List<NotificationDatum>.from(response.body["data"]

            .map((x) => NotificationDatum.fromJson(x)));
        notificationModel.addAll(demoList);
        notificationModel.refresh();
        refresh();
      } else {
        ApiChecker.checkApi(response);
      }
      isLoadMoreRunning(false);
    }
  }



  // loadMore() async {
  //   debugPrint("============== Load More Message ================");
  //   if (rxRequestStatus.value != Status.loading &&
  //       isLoadMoreRunning.value == false &&
  //       totalPage.value != currentPage.value) {
  //     isLoadMoreRunning(true);
  //     page.value += 1;
  //
  //     Response response = await ApiClient.getData(
  //       "${ApiConstant.getMessage}${homeController.chatId.value}?page=$page",
  //     );
  //
  //     if (response.statusCode == 200) {
  //       if (response.body != null && response.body['data'] != null) {
  //         var demoList = List<NotificationDatum>.from(response.body["data"]
  //             .map((x) => NotificationDatum.fromJson(x)));
  //         notificationModel.addAll(demoList);
  //         notificationModel.refresh();
  //       }
  //
  //       if (response.body.containsKey('pagination') && response.body['pagination'] != null) {
  //         currentPage.value = response.body['pagination']['page'] ?? 0;
  //         totalPage.value = response.body['pagination']['totalPage'] ?? 0;
  //       }
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
        scrollController.position.maxScrollExtent){
      loadMore();
    }
  }
  
  @override
  void onInit() {
    listenToNewNotification();
    getNotification();
    scrollController.addListener(addScrollListener);
    super.onInit();
  }

}