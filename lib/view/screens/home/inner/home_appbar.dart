import 'package:dentist/core/app_routes/app_routes.dart';
import 'package:dentist/helper/network_img/network_img.dart';
import 'package:dentist/utils/AppConst/app_const.dart';
import 'package:dentist/utils/StaticString/static_string.dart';
import 'package:dentist/view/widgets/custom_text/custom_text.dart';
import 'package:dentist/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 44.h,
      ),
      child: Column(
        children: [
          ///====================================Top Section================================
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ///==================== Profile =====================
                  CustomNetworkImage(
                      boxShape: BoxShape.circle,
                      imageUrl: AppConstants.onlineImage,
                      height: 60,
                      width: 60),

                  SizedBox(
                    width: 16.w,
                  ),

                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: "Good Morning"),
                      CustomText(
                        text: "Munna Bhai MBPS",
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  ///<==================== notification ====================>
                  IconButton(
                      onPressed: () {
                        Get.toNamed(AppRoute.notification);
                      },
                      icon: const Icon(Icons.notifications)),

                  ///<==================== Menu Bar ====================>
                  IconButton(
                      onPressed: () {
                        scaffoldKey.currentState?.openDrawer();
                      },
                      icon: const Icon(Icons.menu))
                ],
              )
            ],
          ),

          //====================================Search Section================================

          SizedBox(
            height: 8.h,
          ),
          CustomTextField(
            onTapClick: () {
              Get.toNamed(AppRoute.search);
            },
            readOnly: true,
            hintText: AppStaticStrings.searchhere,
            isPrefixIcon: true,
          )
        ],
      ),
    );
  }
}
