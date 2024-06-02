import 'package:dentist/service/api_check.dart';
import 'package:dentist/service/api_client.dart';
import 'package:dentist/service/api_url.dart';
import 'package:dentist/utils/AppConst/app_const.dart';
import 'package:dentist/view/screens/conditionDetails/Model/article_details_model.dart';
import 'package:dentist/view/screens/dentalCondition/Model/article_model.dart';
import 'package:get/get.dart';

class ArticleController extends GetxController{


  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;


  ///<==================== This is for get article by category ======================>

  Rx<ArticaleModel> articleModel = ArticaleModel().obs;

  Future<bool> getArticleByCategory(String name) async {
    setRxRequestStatus(Status.loading);
    var response = await ApiClient.getData("${ApiConstant.articleByCategory}${name}");
    if (response.statusCode == 200) {
      articleModel.value = ArticaleModel.fromJson(response.body);
      update();
      setRxRequestStatus(Status.completed);
      return true;
    } else {
      if (response.statusText == ApiClient.noInternetMessage) {
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



}