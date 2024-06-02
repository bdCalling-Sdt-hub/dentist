import 'package:dentist/service/api_check.dart';
import 'package:dentist/service/api_client.dart';
import 'package:dentist/service/api_url.dart';
import 'package:dentist/utils/AppConst/app_const.dart';
import 'package:dentist/view/screens/home/Mdel/profile_model.dart';
import 'package:dentist/view/screens/my_plan/Model/my_plan_model.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController with GetxServiceMixin{

  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  ///<================================== This is for get profile data ======================>

  Rx<ProfileModel> userProfileModel = ProfileModel().obs;

  Future<bool> getUserProfileData() async {
    setRxRequestStatus(Status.loading);
    var response = await ApiClient.getData(ApiConstant.userProfile);
    if (response.statusCode == 200) {
      userProfileModel.value = ProfileModel.fromJson(response.body);

      print("This is the user name ==${userProfileModel.value.data?.patient?.name??""}");

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

  ///<================================== This is for get package data ======================>

  Rx<PackageModel> userPackageModel = PackageModel().obs;

  Future<bool> getUserPackage() async {
    setRxRequestStatus(Status.loading);
    var response = await ApiClient.getData(ApiConstant.package);
    if (response.statusCode == 200) {
      userPackageModel.value = PackageModel.fromJson(response.body);
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

  @override
  void onInit() {
    getUserProfileData();
    getUserPackage();
    super.onInit();
  }
}