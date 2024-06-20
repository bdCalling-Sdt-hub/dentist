import 'package:dentist/helper/shared_prefe/shared_prefe.dart';
import 'package:dentist/service/api_check.dart';
import 'package:dentist/service/api_client.dart';
import 'package:dentist/service/api_url.dart';
import 'package:dentist/service/socket_service.dart';
import 'package:dentist/utils/AppConst/app_const.dart';
import 'package:dentist/view/screens/message/Model/message_model.dart';
import 'package:dentist/view/screens/notification/Model/notification_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class NotificationController extends GetxController{
  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  ScrollController scrollController = ScrollController();

  // void scrollToBottom() {
  //   if (scrollController.hasClients) {
  //     Future.delayed(Duration(milliseconds: 300), () {
  //       scrollController.jumpTo(scrollController.position.maxScrollExtent);
  //     });
  //   }
  // }
  //

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



  @override
  void onInit() {
    listenToNewNotification();
    getNotification();
    super.onInit();
  }

}