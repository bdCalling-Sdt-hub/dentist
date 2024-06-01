import 'package:dentist/service/api_check.dart';
import 'package:dentist/service/api_client.dart';
import 'package:dentist/service/api_url.dart';
import 'package:dentist/utils/AppConst/app_const.dart';
import 'package:dentist/view/screens/terms_condition/Model/terms_condition_model.dart';
import 'package:get/get.dart';

class TermsConditionController extends GetxController{

  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  ///<============================= This is for terms condition ======================>

  Rx<TermsConditionModel> termsConditionModel = TermsConditionModel().obs;

  Future<bool> getTermsCondition() async {
    setRxRequestStatus(Status.loading);
    var response = await ApiClient.getData(ApiConstant.termsCondition);
    if (response.statusCode == 200) {

      termsConditionModel.value = TermsConditionModel.fromJson(response.body);
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
    getTermsCondition();
    super.onInit();
  }

}