import 'package:dentist/helper/network_img/network_img.dart';
import 'package:dentist/utils/AppColors/app_colors.dart';
import 'package:dentist/utils/AppConst/app_const.dart';
import 'package:dentist/utils/StaticString/static_string.dart';
import 'package:dentist/view/widgets/custom_button/custom_button.dart';
import 'package:dentist/view/widgets/custom_text/custom_text.dart';
import 'package:dentist/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  Widget textInfo(
          {required String key,
          required String hintText,
          required TextEditingController controller}) =>
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
              textEditingController: controller,
              hintText: hintText,
            )
          ],
        ),
      );

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
      body: SingleChildScrollView(
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

                    CustomNetworkImage(
                        boxShape: BoxShape.circle,
                        imageUrl: AppConstants.onlineImage,
                        height: 100,
                        width: 100),
                  ],
                ),
              ),

              ///============================= Bottom Design ============================
              Form(
                  child: Column(
                children: [
                  ///====================== Name =====================
                  textInfo(
                      controller: TextEditingController(),
                      hintText: AppStaticStrings.enterYourName,
                      key: AppStaticStrings.name),

                  ///====================== Email =====================

                  textInfo(
                      controller: TextEditingController(),
                      hintText: AppStaticStrings.enterYourEmail,
                      key: AppStaticStrings.email),

                  ///====================== Contact No =====================

                  textInfo(
                      controller: TextEditingController(),
                      hintText: AppStaticStrings.enterYourContact,
                      key: AppStaticStrings.contactNo),

                  ///====================== Date Of Birth =====================

                  textInfo(
                      controller: TextEditingController(),
                      hintText: AppStaticStrings.enterYourDateOfBirth,
                      key: AppStaticStrings.dateofbirth),

                  ///====================== Age =====================

                  textInfo(
                      controller: TextEditingController(),
                      hintText: AppStaticStrings.enterYourAge,
                      key: AppStaticStrings.age),

                  ///====================== Pin =====================

                  textInfo(
                      controller: TextEditingController(),
                      hintText: AppStaticStrings.enterYourPin,
                      key: AppStaticStrings.pinNo),

                  ///====================== Gender =====================

                  textInfo(
                      controller: TextEditingController(),
                      hintText: AppStaticStrings.enterYourGender,
                      key: AppStaticStrings.gender),

                  ///====================== Save Button =====================

                  CustomButton(
                    onTap: () {},
                    title: AppStaticStrings.saveChange,
                  ),
                  const SizedBox(
                    height: 24,
                  )
                ],
              ))
            ],
          )),
    );
  }
}
