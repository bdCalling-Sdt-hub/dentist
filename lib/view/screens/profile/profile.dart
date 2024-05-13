import 'package:dentist/helper/network_img/network_img.dart';
import 'package:dentist/utils/AppColors/app_colors.dart';
import 'package:dentist/utils/AppConst/app_const.dart';
import 'package:dentist/utils/StaticString/static_string.dart';
import 'package:dentist/view/widgets/custom_text/custom_text.dart';
import 'package:dentist/view/widgets/navBar/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Widget infoDesign({
    required String key,
    required String value,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            color: AppColors.green800,
            text: key,
            fontSize: 14.w,
          ),
          CustomText(
            color: AppColors.green800,
            text: value,
            bottom: 16,
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const NavBar(currentIndex: 2),
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.edit))],
        title: const CustomText(
          text: AppStaticStrings.userProfile,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///============================= Top Design ============================
              Container(
                margin: EdgeInsets.only(bottom: 20.h),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: AppColors.green500,
                    borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.all(20.r),
                child: Column(
                  children: [
                    ///======================= Image =====================

                    CustomNetworkImage(
                        boxShape: BoxShape.circle,
                        imageUrl: AppConstants.onlineImage,
                        height: 100,
                        width: 100),

                    ///======================= User Name =====================
                    CustomText(
                      top: 10,
                      text: "Patient Mahmud",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.loght100,
                    ),

                    ///======================= User Disicess =====================
                    const CustomText(
                      text: "(Gum patient)",
                      fontWeight: FontWeight.w500,
                      color: AppColors.loght100,
                    ),
                  ],
                ),
              ),

              ///============================= Bottom Design ============================
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///==================== Name ===================
                  infoDesign(
                      key: AppStaticStrings.name, value: "Rafsan Hossain"),

                  ///==================== Email ===================
                  infoDesign(
                      key: AppStaticStrings.email, value: "Dentist@gmail.com"),

                  ///==================== Contact No ===================
                  infoDesign(key: AppStaticStrings.contactNo, value: "0199"),

                  ///==================== Date Of Birth ===================
                  infoDesign(
                      key: AppStaticStrings.dateofbirth, value: "16 jan 2001"),

                  ///==================== Gender ===================
                  infoDesign(key: AppStaticStrings.gender, value: "Male"),

                  ///==================== Plan ===================
                  infoDesign(
                      key: AppStaticStrings.plan,
                      value: "Patient health condition/ what to do."),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
