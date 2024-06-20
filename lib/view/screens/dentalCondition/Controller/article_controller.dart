import 'package:dentist/global/controller/generelController.dart';
import 'package:dentist/service/api_check.dart';
import 'package:dentist/service/api_client.dart';
import 'package:dentist/service/api_url.dart';
import 'package:dentist/utils/AppConst/app_const.dart';
import 'package:dentist/view/screens/conditionDetails/Model/article_details_model.dart';
import 'package:dentist/view/screens/dentalCondition/Model/article_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticleController extends GetxController{


  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;



  ScrollController scrollController = ScrollController();
  GeneralController generalController = Get.find<GeneralController>();
  RxInt totalPage = 0.obs;
  RxInt currentPage = 0.obs;




  ///<==================== This is for get article by category ======================>

  Rx<ArticaleModel> articleModel = ArticaleModel().obs;

  Future<bool> getArticleByCategory(String name,bool category)async{
    setRxRequestStatus(Status.loading);
    var response;
    if(category==true){
      response = await ApiClient.getData("${ApiConstant.articleByCategory}${name}");
    }else{
      response = await ApiClient.getData("${ApiConstant.article}?search=$name");
    }
    if (response.statusCode == 200) {
      articleModel.value = ArticaleModel.fromJson(response.body);
      update();
      setRxRequestStatus(Status.completed);
      return true;
    } else {
      if (response.statusText == ApiClient.noInternetMessage){
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);
      return false;
    }
  }

  // ///<=========== This is for article details ===================>
  //
  // Rx<ArticleDetailsModel> artiCleDetailsModel = ArticleDetailsModel().obs;
  //
  // Future<bool> getArticleDetails(String id) async {
  //   setRxRequestStatus(Status.loading);
  //   var response = await ApiClient.getData("${ApiConstant.singleArticle}${id}");
  //   if (response.statusCode == 200) {
  //     artiCleDetailsModel.value = ArticleDetailsModel.fromJson(response.body);
  //     update();
  //     setRxRequestStatus(Status.completed);
  //     return true;
  //   } else {
  //     if (response.statusText == ApiClient.noInternetMessage){
  //       setRxRequestStatus(Status.internetError);
  //     } else {
  //       setRxRequestStatus(Status.error);
  //     }
  //     ApiChecker.checkApi(response);
  //     return false;
  //   }
  // }

  // ///============================= Load More Data ============================
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
  //       var demoList = List<ArticaleModel>.from(response.body["data"]
  //           .map((x) => ArticaleModel.fromJson(x)));
  //
  //       articleModel.addAll(demoList);
  //
  //       articleModel.refresh();
  //       refresh();
  //     } else {
  //       ApiChecker.checkApi(response);
  //     }
  //     isLoadMoreRunning(false);
  //   }
  // }
  //
  //
  // ///===================Pagination Scroll Controller===============
  //
  // Future<void> addScrollListener() async {
  //   if (scrollController.position.pixels ==
  //       scrollController.position.maxScrollExtent) {
  //     loadMore();
  //   }
  // }

}