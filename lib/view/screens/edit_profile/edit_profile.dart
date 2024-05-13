import 'package:dentist/helper/network_img/network_img.dart';
import 'package:dentist/utils/AppColors/app_colors.dart';
import 'package:dentist/utils/AppConst/app_const.dart';
import 'package:dentist/utils/StaticString/static_string.dart';
import 'package:dentist/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

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
      body: Padding(
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
            ],
          )),
    );
  }
}
