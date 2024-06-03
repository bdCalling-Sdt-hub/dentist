import 'package:dentist/core/app_routes/app_routes.dart';
import 'package:dentist/helper/GenerelError/general_error.dart';
import 'package:dentist/helper/network_img/network_img.dart';
import 'package:dentist/service/api_url.dart';
import 'package:dentist/utils/AppConst/app_const.dart';
import 'package:dentist/utils/StaticString/static_string.dart';
import 'package:dentist/view/screens/home/controller/homecontroller.dart';
import 'package:dentist/view/widgets/custom_loader/custom_loader.dart';
import 'package:dentist/view/widgets/custom_text/custom_text.dart';
import 'package:dentist/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget {
   HomeAppBar({
    super.key,
    required this.scaffoldKey,
  });

  HomeController controller=Get.find<HomeController>();

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return
      Obx(() {
        switch (controller.rxRequestStatus.value){
          case Status.loading:
            return const CustomLoader();
          case Status.internetError:
            return const CustomLoader();
          case Status.error:
            return GeneralErrorScreen(
              onTap: () {
                controller.getUserProfileData();
              },
            );
          case Status.completed:

            return   Container(
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
                              imageUrl:
                              "${ApiConstant.baseUrl}${controller.userProfileModel.value.data?.patient?.profile??""}",
                              height: 60,
                              width: 60),

                          SizedBox(
                            width: 16.w,
                          ),

                           Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomText(text: "Wellcome"),
                              CustomText(
                                text:controller.userProfileModel.value.data?.patient?.name??"",
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
      });

  }
}
