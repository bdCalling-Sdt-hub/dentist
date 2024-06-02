import 'package:dentist/service/api_check.dart';
import 'package:dentist/service/api_client.dart';
import 'package:dentist/service/api_url.dart';
import 'package:dentist/utils/AppConst/app_const.dart';
import 'package:dentist/view/screens/about_us/Model/about_us_model.dart';
import 'package:get/get.dart';

class AboutUsController extends GetxController{
  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  ///<============================= This is for terms condition ======================>

  Rx<AboutUsModel> aboutUsModel = AboutUsModel().obs;

  Future<bool> getAboutUs() async {
    setRxRequestStatus(Status.loading);
    var response = await ApiClient.getData(ApiConstant.aboutUs);
    if (response.statusCode == 200) {

      aboutUsModel.value = AboutUsModel.fromJson(response.body);
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
    getAboutUs();
    super.onInit();
  }



}