
import 'package:dentist/core/app_routes/app_routes.dart';
import 'package:dentist/helper/shared_prefe/shared_prefe.dart';
import 'package:dentist/utils/AppConst/app_const.dart';
import 'package:dentist/utils/ToastMsg/toast_message.dart';
import 'package:get/get.dart';


class ApiChecker {
  static void checkApi(Response response, {bool getXSnackBar = false}) async {
    if (response.statusCode == 401) {
      await SharePrefsHelper.remove(AppConstants.bearerToken);
      Get.offAllNamed(AppRoute.signIn);
    } else {
      showCustomSnackBar(response.statusText!, getXSnackBar: getXSnackBar);
    }
  }
}
