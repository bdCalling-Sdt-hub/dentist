import 'package:dentist/utils/AppColors/app_colors.dart';
import 'package:dentist/utils/StaticString/static_string.dart';
import 'package:dentist/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.height = 48,
      this.width = double.maxFinite,
      required this.onTap,
      this.title = AppStaticStrings.welcomeBack,
      this.marginVerticel = 0,
      this.marginHorizontal = 0});

  final double height;
  final double width;

  final VoidCallback onTap;

  final String title;

  final double marginVerticel;
  final double marginHorizontal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: marginVerticel, horizontal: marginHorizontal),
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: AppColors.green500),
        child: CustomText(
            fontWeight: FontWeight.w500,
            color: AppColors.loght100,
            textAlign: TextAlign.center,
            text: title),
      ),
    );
  }
}
