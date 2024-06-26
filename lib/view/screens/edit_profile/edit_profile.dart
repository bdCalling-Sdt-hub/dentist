import 'dart:io';
import 'package:dentist/helper/network_img/network_img.dart';
import 'package:dentist/service/api_url.dart';
import 'package:dentist/utils/AppColors/app_colors.dart';
import 'package:dentist/utils/AppConst/app_const.dart';
import 'package:dentist/utils/StaticString/static_string.dart';
import 'package:dentist/view/screens/profile/Controller/profile_controller.dart';
import 'package:dentist/view/widgets/custom_button/custom_button.dart';
import 'package:dentist/view/widgets/custom_loader/custom_loader.dart';
import 'package:dentist/view/widgets/custom_text/custom_text.dart';
import 'package:dentist/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});

 // ProfileController controller = Get.find<ProfileController>();

  Widget textInfo(
          {required String key,
          required String hintText,
          required TextEditingController controller,
          required String? Function(dynamic)? validator
          }) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: key,
              bottom: 10,
              fontSize: 16,
            ),
            CustomTextField(
              validator: validator,
              textEditingController: controller,
              hintText: hintText,
            )
          ],
        ),
      );

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const CustomText(
            text: AppStaticStrings.editUserProfile,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        body: GetBuilder<ProfileController>(
          builder: (controller) {
            return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                child: Column(
                  children: [
                    ///============================= Top Design ============================
                    Container(
                      margin: EdgeInsets.only(bottom: 20.h),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.loght200,
                        boxShadow: const [
                          BoxShadow(
                            color: AppColors.loght600,
                            offset: Offset(0.1, 1.0), //(x,y)
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(20.r),
                      child: Column(
                        children: [
                          ///======================= Image =====================

                          GestureDetector(
                            onTap: () {
                              controller.openGallery();
                              controller.update();
                            },
                            child:  controller.proImage!=null?Container(
                            height: 90.h,
                            width: 90.w,
                            decoration: BoxDecoration(
                            shape: BoxShape.circle,
                             image: DecorationImage(
                                 fit: BoxFit.fill,
                                 image:FileImage(File(controller.proImage!.path)))
                            ),
                            ):
                                CustomNetworkImage(
                                boxShape: BoxShape.circle,
                                imageUrl:controller.userProfileModel.value.data?.patient?.profile?.isNotEmpty==true?
                                (controller.userProfileModel.value.data?.patient?.profile?.startsWith('https') ??false)?
                                controller.userProfileModel.value.data?.patient?.profile?? ""  :
                                "${ApiConstant.baseUrl}${controller.userProfileModel.value.data?.patient?.profile ??""}"
                                      :AppConstants.onlineImage,
                                height: 100,
                                width: 100),
                          ),
                        ],
                      ),
                    ),

                    ///============================= Bottom Design ============================
                    Form(
                      key: formKey,
                        child: Column(
                      children: [
                        ///====================== Name =====================
                        textInfo(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppStaticStrings.fieldCantBeEmpty;
                              }else{
                                return null;
                              }
                            },
                            controller: controller.nameController,
                            hintText: AppStaticStrings.enterYourName,
                            key: AppStaticStrings.name),

                        // /====================== Email =====================
                        //
                        // textInfo(
                        //     controller: TextEditingController(),
                        //     hintText: AppStaticStrings.enterYourEmail,
                        //     key: AppStaticStrings.email),

                        ///====================== Contact No =====================

                        textInfo(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppStaticStrings.fieldCantBeEmpty;
                              }else{
                                return null;
                              }
                            },
                            controller: controller.phoneController,
                            hintText: AppStaticStrings.enterYourContact,
                            key: AppStaticStrings.contactNo),

                        ///====================== Date Of Birth =====================
                        // textInfo(
                        //     controller: TextEditingController(),
                        //     hintText: AppStaticStrings.enterYourDateOfBirth,
                        //     key: AppStaticStrings.dateofbirth),

                        // ///====================== Age =====================
                        //
                        // textInfo(
                        //     controller: TextEditingController(),
                        //     hintText: AppStaticStrings.enterYourAge,
                        //     key: AppStaticStrings.age),
                        //
                        // ///====================== Pin =====================
                        //
                        // textInfo(
                        //     controller: TextEditingController(),
                        //     hintText: AppStaticStrings.enterYourPin,
                        //     key: AppStaticStrings.pinNo),
                        //
                        // ///====================== Gender =====================
                        //
                        // textInfo(
                        //     controller: TextEditingController(),
                        //     hintText: AppStaticStrings.enterYourGender,
                        //     key: AppStaticStrings.gender),
                        //
                        // ///====================== Save Button =====================
                          controller.profileUpdateLoading==true?CustomLoader():CustomButton(
                                onTap: () {
                                  if(formKey.currentState!.validate()){
                                    controller.editProfile();
                                  }
                                },
                                title: AppStaticStrings.saveChange,
                              ),
                        const SizedBox(
                          height: 24,
                        )
                      ],
                    ))
                  ],
                ));
          }
        ));
  }
}
