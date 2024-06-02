import 'package:dentist/service/api_check.dart';
import 'package:dentist/service/api_client.dart';
import 'package:dentist/service/api_url.dart';
import 'package:dentist/utils/AppConst/app_const.dart';
import 'package:dentist/view/screens/privacy_policy/Model/privacy_policy-model.dart';
import 'package:get/get.dart';

class PrivacyController extends GetxController{

  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  ///<============================= This is for terms condition ======================>

  Rx<PrivacyPolicyModel> privacyPolicyModel = PrivacyPolicyModel().obs;

  Future<bool> getPrivacyPolicy() async {
    setRxRequestStatus(Status.loading);
    var response = await ApiClient.getData(ApiConstant.privacyPolicy);
    if (response.statusCode == 200) {

      privacyPolicyModel.value = PrivacyPolicyModel.fromJson(response.body);
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
    getPrivacyPolicy();
    super.onInit();
  }


}