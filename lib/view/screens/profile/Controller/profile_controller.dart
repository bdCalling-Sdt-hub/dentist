import 'dart:io';
import 'package:dentist/view/screens/home/controller/homecontroller.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:dentist/service/api_check.dart';
import 'package:dentist/service/api_client.dart';
import 'package:dentist/service/api_url.dart';
import 'package:dentist/utils/AppConst/app_const.dart';
import 'package:dentist/view/screens/home/Mdel/profile_model.dart';
import 'package:dentist/view/screens/my_plan/Model/my_plan_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import '../../../../helper/shared_prefe/shared_prefe.dart';

class ProfileController extends GetxController with GetxServiceMixin {

  HomeController homeController=Get.find<HomeController>();

  final rxRequestStatus = Status.loading.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;



  TextEditingController phoneController=TextEditingController();
  TextEditingController nameController=TextEditingController();


  addTextFieldData(String name,String phone){
    nameController.text=name??"";
    phoneController.text=phone??"";
  }


  ///<================================== This is for get profile data ======================>

  Rx<ProfileModel> userProfileModel = ProfileModel().obs;

  Future<bool> getUserProfileData() async {
    setRxRequestStatus(Status.loading);
    var response = await ApiClient.getData(ApiConstant.userProfile);
    if (response.statusCode == 200) {
      userProfileModel.value = ProfileModel.fromJson(response.body);
      addTextFieldData(
      userProfileModel.value.data?.patient?.name??"" ,
      userProfileModel.value.data?.patient?.contactNo??""
      );
      print("This is the user name ==${userProfileModel.value.data?.patient
          ?.name ?? ""}");

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


     getUserPackage() async {
    setRxRequestStatus(Status.loading);
    var response = await ApiClient.getData(ApiConstant.package);
    if (response.statusCode == 200) {
      userPackageModel.value = PackageModel.fromJson(response.body);

      setRxRequestStatus(Status.completed);

    } else {
      if (response.statusText == ApiClient.noInternetMessage) {
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);

    }
  }

  ///<======================= This is fro get image from gallery ===================>
  File? proImage;
  void openGallery() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 15,
    );
    if (pickedFile != null) {
      proImage = File(pickedFile.path);
      update();
    }
  }

///<================= This is for update profile ======================>
  ///
  bool profileUpdateLoading=false;
  editProfile() async {
    profileUpdateLoading = true;
    var bearerToken =
    await SharePrefsHelper.getString(AppConstants.bearerToken);
    update();
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $bearerToken'
    };
    var body = {
      "name": nameController.text,
      "contactNo": phoneController.text,
    };
    var response = proImage == null
        ? await ApiClient.patchData(
      headers: headers,
      ApiConstant.editProfile,
      body,
    )
        : await ApiClient.patchMultipartData(ApiConstant.editProfile,body,
        headers: headers,
        multipartBody: [
          MultipartBody("profile",proImage!),
        ]);
    if (response.statusCode == 200) {
      getUserProfileData();
      homeController.getUserProfileData();
      homeController.setRxRequestStatus(Status.completed);
      navigator!.pop();
      Get.snackbar("", "Update Successfully");
    } else {
      ApiChecker.checkApi(response);
    }
    profileUpdateLoading = false;
    update();
  }

@override
  void onInit() {
  getUserProfileData();
   getUserPackage();
    super.onInit();
  }



}