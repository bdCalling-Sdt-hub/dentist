import 'package:dentist/core/app_routes/app_routes.dart';
import 'package:dentist/utils/AppColors/app_colors.dart';
import 'package:dentist/utils/AppIcons/app_icons.dart';
import 'package:dentist/utils/StaticString/static_string.dart';
import 'package:dentist/view/widgets/custom_image/custom_image.dart';
import 'package:dentist/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

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
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: AppStaticStrings.settings,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          children: [
            customRow(
                image: AppIcons.changePass,
                onTap: () {
                  Get.offAllNamed(AppRoute.profile);
                },
                title: AppStaticStrings.changePassword),
          ],
        ),
      ),
    );
  }
}
