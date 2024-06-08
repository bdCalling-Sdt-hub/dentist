import 'package:dentist/helper/shared_prefe/shared_prefe.dart';
import 'package:dentist/service/api_check.dart';
import 'package:dentist/service/api_client.dart';
import 'package:dentist/service/api_url.dart';
import 'package:dentist/utils/AppConst/app_const.dart';
import 'package:dentist/view/screens/home/Mdel/article_category_model.dart';
import 'package:dentist/view/screens/home/Mdel/banner_model.dart';
import 'package:dentist/view/screens/home/Mdel/faq_model.dart';
import 'package:dentist/view/screens/home/Mdel/offer_model.dart';
import 'package:dentist/view/screens/home/Mdel/profile_model.dart';
import 'package:dentist/view/screens/home/Mdel/smart_check_model.dart';
import 'package:dentist/view/screens/message/Model/message_model.dart';
import 'package:dentist/view/screens/offer_details/Model/offer_details_moel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController with GetxServiceMixin {


  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;


  RxInt bannerIndex = 0.obs;
  Rx<PageController> pageController = PageController().obs;

  RxInt selectedFqw = 100000.obs;

  ///<================================== This is for get profile data ======================>

  Rx<ProfileModel> userProfileModel = ProfileModel().obs;

  Future<bool> getUserProfileData() async {
     setRxRequestStatus(Status.loading);
    var response = await ApiClient.getData(ApiConstant.userProfile);
    if (response.statusCode == 200) {
      userProfileModel.value = ProfileModel.fromJson(response.body);

      print("This is the user name ==${userProfileModel.value.data?.patient?.name??""}");

      update();
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


  ///<============================== This is for banner section ============================>

  RxList<BannerListDatum> bannerList = <BannerListDatum>[].obs;

  Future<bool> getBanner() async {
    var response = await ApiClient.getData(ApiConstant.banner);
    if (response.statusCode == 200) {

      bannerList.value = List<BannerListDatum>.from(
          response.body["data"].map((x) => BannerListDatum.fromJson(x)));

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

  ///<========================= This is for get offer =====================================>
  Rx<OfferModel> offerModel = OfferModel().obs;

  Future<bool> getAllOffer() async {

    var response = await ApiClient.getData(ApiConstant.offer);
    if (response.statusCode == 200) {

      // bannerList.value = List<BannerListDatum>.from(
      //     response.body["data"].map((x) => BannerListDatum.fromJson(x)));

      offerModel.value = OfferModel.fromJson(response.body);


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

  ///<======================= This is for smart check ==============================>

  Rx<SmartCheckModel> smartCheckModel = SmartCheckModel().obs;

  Future<bool> smartCheck() async {
    var response = await ApiClient.getData(ApiConstant.smartCheck);
    if (response.statusCode == 200) {

      // bannerList.value = List<BannerListDatum>.from(
      //     response.body["data"].map((x) => BannerListDatum.fromJson(x)));
      smartCheckModel.value = SmartCheckModel.fromJson(response.body);

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

///<========================= This is for FAQ ======================================>
  Rx<FaqMOdel> faqModel = FaqMOdel().obs;

  Future<bool> getFAQ() async {
    var response = await ApiClient.getData(ApiConstant.faq);
    if (response.statusCode == 200) {

      // bannerList.value = List<BannerListDatum>.from(
      //     response.body["data"].map((x) => BannerListDatum.fromJson(x)));
      faqModel.value = FaqMOdel.fromJson(response.body);


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

  ///<========================= This is for articleCategory =======================>
  Rx<ArticleCategoryMOdel> articleCategoryModel = ArticleCategoryMOdel().obs;

  Future<bool> getArticleCategory() async {

    // var bearerToken = await SharePrefsHelper.getString(AppConstants.bearerToken); // Method to retrieve JWT
    //
    // var headers = {
    //   'Accept': 'application/json',
    //   'Authorization': 'Bearer $bearerToken',
    // };

    var response = await ApiClient.getData(ApiConstant.articleCategory);
    if (response.statusCode == 200) {

      // bannerList.value = List<BannerListDatum>.from(
      //     response.body["data"].map((x) => BannerListDatum.fromJson(x)));
      articleCategoryModel.value = ArticleCategoryMOdel.fromJson(response.body);
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
  ///<================================ Offer details =============================>

  Rx<OfferDetailsModel> offerDetailsModel = OfferDetailsModel().obs;

  Future<bool> getOfferDetails(String id) async {

    var response = await ApiClient.getData("${ApiConstant.offer}/${id}");
    if (response.statusCode == 200) {

      offerDetailsModel.value = OfferDetailsModel.fromJson(response.body);

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

  homeApi()async{
   bool profile= await getUserProfileData() ;
   bool banner= await  getBanner(); ;
   bool offer= await   getAllOffer() ;
   bool smartcheck= await smartCheck() ;
   bool faq= await getFAQ() ;
   bool articleCat= await getArticleCategory() ;

   if(profile && banner &&offer && smartcheck &&faq && articleCat){
     setRxRequestStatus(Status.completed);
     refresh();
   }



  }


  @override
  void onInit() {
    homeApi();
    super.onInit();
  }


}
