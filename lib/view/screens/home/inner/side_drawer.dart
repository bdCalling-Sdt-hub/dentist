import 'package:dentist/core/app_routes/app_routes.dart';
import 'package:dentist/helper/shared_prefe/shared_prefe.dart';
import 'package:dentist/utils/AppColors/app_colors.dart';
import 'package:dentist/utils/AppConst/app_const.dart';
import 'package:dentist/utils/AppIcons/app_icons.dart';
import 'package:dentist/utils/StaticString/static_string.dart';
import 'package:dentist/view/widgets/custom_image/custom_image.dart';
import 'package:dentist/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  Widget customRow(
          {required String image,
          required String title,
          required VoidCallback onTap}) =>
      GestureDetector(
        onTap: () {
          onTap();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              CustomImage(
                size: 18.r,
                imageSrc: image,
              ),
              CustomText(
                color: AppColors.green800,
                left: 16.w,
                text: title,
                fontSize: 12.w,
              )
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 64),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(8.r), bottomRight: Radius.circular(8.r)),
        color: AppColors.loght100,
      ),
      //height: double.maxFinite,
      width: MediaQuery.of(context).size.width / 1.3,
      child: Column(
        children: [
          ///================================ APP LOGO ==============================///
          const CustomImage(
            size: 100,
            imageSrc: AppIcons.logo,
            imageType: ImageType.png,
          ),

          ///================================ APP Name ==============================///

          const CustomText(
            text: AppStaticStrings.dentalApp,
            fontSize: 16,
            color: AppColors.green700,
            fontWeight: FontWeight.w500,
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 30.h, left: 20.w, right: 20.w),
                child: Column(
                  children: [
                    ///====================== My Profile ======================>

                    customRow(
                        image: AppIcons.profileUnselected,
                        onTap: () {
                          Get.offAllNamed(AppRoute.profile);
                        },
                        title: AppStaticStrings.myProfile),

                    ///======================= Settings =========================

                    customRow(
                        image: AppIcons.settings,
                        onTap: () {
                          Get.toNamed(AppRoute.settings);
                        },
                        title: AppStaticStrings.settings),

                    const Divider(),

                    ///======================= FAQ ========================

                    customRow(
                        image: AppIcons.faq,
                        onTap: () {
                          Get.toNamed(AppRoute.faq);
                        },
                        title: AppStaticStrings.fAQ),

                    ///======================= About Us ========================

                    customRow(
                        image: AppIcons.aboutUs,
                        onTap: () {
                          Get.toNamed(AppRoute.aboutUs);
                        },
                        title: AppStaticStrings.aboutUs),

                    ///======================= Privacy Policy ========================

                    customRow(
                        image: AppIcons.privacyPolicy,
                        onTap: () {
                          Get.toNamed(AppRoute.privacyPolicy);
                        },
                        title: AppStaticStrings.privacyPolicy),

                    ///======================= Terms and Condition ========================

                    customRow(
                        image: AppIcons.terms,
                        onTap: () {
                          Get.toNamed(AppRoute.termsCondition);
                        },
                        title: AppStaticStrings.termsConditions),

                    const Divider(),

                    ///======================= Log Out ========================

                    customRow(
                        image: AppIcons.logOut,
                        onTap: ()async{
                          SharePrefsHelper.remove(
                              AppConstants
                                  .bearerToken);
                          SharePrefsHelper.remove(AppConstants.rememberMe);
                          SharePrefsHelper.setBool(AppConstants.onBoard,false);
                          var value=await SharePrefsHelper.getBool(AppConstants.rememberMe);
                          print(value);
                          Get.offAllNamed(AppRoute.signIn);
                        },
                        title: AppStaticStrings.logOut),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
