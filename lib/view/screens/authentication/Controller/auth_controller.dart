import 'package:dentist/core/app_routes/app_routes.dart';
import 'package:dentist/helper/shared_prefe/shared_prefe.dart';
import 'package:dentist/service/api_check.dart';
import 'package:dentist/service/api_client.dart';
import 'package:dentist/service/api_url.dart';
import 'package:dentist/utils/AppConst/app_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{

   ///<================================== Text Editing controller for reset pass screen =====================>

  TextEditingController resetPassController=TextEditingController();

  TextEditingController resetConfirmPassController=TextEditingController();

  ///<================================== Text Editing controller for Sign in screen =====================>

  TextEditingController signInEmailController=TextEditingController();

  TextEditingController signInPassController=TextEditingController();

  TextEditingController signInPinController=TextEditingController();


  TextEditingController forgotEmailController=TextEditingController();


///<==================================  This is for Sign In =================================>

  bool signInLoading = false;
  signInUser() async {
    signInLoading = true;
    update();
    Map<String, String> body = {
      'email':signInEmailController.text,
      'password':signInPassController.text,
      'pin':signInPinController.text,
    };

    var response = await ApiClient.postData(
      ApiConstant.signIn,
      body,
    );

    if (response.statusCode == 200) {
      SharePrefsHelper.setString(
          AppConstants.bearerToken, response.body["data"]);
         SharePrefsHelper.setBool(AppConstants.rememberMe,true);
         update();
      Get.offAllNamed(AppRoute.home);
    } else {
      ApiChecker.checkApi(response);
    }
    signInLoading = false;
    update();
  }


  ///<========================== This is for forgot password =========================>

  handleForgetPassword() async {
    signInLoading = true;
    update();
    var body = {"email": forgotEmailController.text.trim()};
    var response = await ApiClient.postData(
      ApiConstant.forgotPassword,
      body,
    );
    if (response.statusCode == 200) {
      Get.toNamed(AppRoute.otpScreen);
    } else {
      ApiChecker.checkApi(response);
    }
    signInLoading = false;
    update();
  }

  ///<==================== This is verify otp section ===========================>


  String otp = '';
  String token = '';
  forgotOTp() async {
    signInLoading = true;
    update();
    Map<String, dynamic> body = {
      "email": forgotEmailController.text,
      "code":otp
    };
    var response = await ApiClient.postData(
      ApiConstant.verifyOTP,
      body,
    );

    if (response.statusCode == 200) {
      token = response.body["data"];
      Get.toNamed(AppRoute.resetPasswordScreen);
    } else {
      ApiChecker.checkApi(response);
    }
    signInLoading = false;
    update();

    //print('email============${emailController.text}');
  }


  ///<======================= This is for reset password section =======================>

  handleResetPassword() async {
    signInLoading = true;
    update();

    Map<String, String> header = {'authorization': token};
    var body = {
      "newPassword":resetPassController.text,
      "confirmPassword":resetConfirmPassController.text,
    };
    var response =
    await ApiClient.postData(ApiConstant.resetPassword, body, headers: header);

    if (response.statusCode == 200) {
      Get.snackbar("Done", "Successfully updated");
      Get.offAllNamed(AppRoute.signIn);
    } else {
      ApiChecker.checkApi(response);
    }

    signInLoading = false;
    update();
  }


}