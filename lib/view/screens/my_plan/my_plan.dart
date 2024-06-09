import 'package:dentist/helper/GenerelError/general_error.dart';
import 'package:dentist/utils/AppColors/app_colors.dart';
import 'package:dentist/utils/AppConst/app_const.dart';
import 'package:dentist/utils/AppIcons/app_icons.dart';
import 'package:dentist/utils/StaticString/static_string.dart';
import 'package:dentist/view/screens/profile/Controller/profile_controller.dart';
import 'package:dentist/view/widgets/custom_loader/custom_loader.dart';
import 'package:dentist/view/widgets/custom_text/custom_text.dart';
import 'package:dentist/view/widgets/navBar/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyPlan extends StatelessWidget {
  MyPlan({super.key});

  final List<String> planList = [
    "Complimentary Dental Examinations",
    "Complimentary Hygienist Cleans",
    "Complimentary Dental X-rays",
    "Complimentary 3D in-mouth scans",
    "Priority Appointments",
    "Discounted Routine Dental Treatments",
    "Free Private Prescriptions",
    "Free Referrals",
    "Fee Skin Consultations",
    "Cancer screening",
    "Free Referrals",
    "Worldwide Accident and Emergency Dental Cover",
  ];

  ProfileController controller=Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const NavBar(currentIndex: 1),
      appBar: AppBar(
        title: const CustomText(
          text: AppStaticStrings.myPlan,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),

      body:
      Obx(() {
        switch (controller.rxRequestStatus.value){
          case Status.loading:
            return const CustomLoader();
          case Status.internetError:
            return const CustomLoader();
          case Status.error:
            return GeneralErrorScreen(
              onTap: () {
                controller.getUserPackage();
              },
            );
          case Status.completed:
            return   Container(
              margin: EdgeInsets.all(20.r),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.1, 1.0), //(x,y)
                      blurRadius: 4,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.loght600,

                  ///======================= Back Ground Image =======================

                  image: const DecorationImage(
                      image: AssetImage(AppIcons.logo),
                      opacity: .05,
                      fit: BoxFit.contain)),

              padding: EdgeInsets.all(20.r),

              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                     CustomText(
                      bottom: 20,
                      text:controller.userPackageModel.value.data?.packageName??"",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),

                    ///======================== Package Featurs ======================

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                          controller.userPackageModel.value.data?.packageDetails?.length ?? 0,
                              (index) => Row(
                            children: [

                              Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      20.0), // Adjust the radius as needed
                                ),
                                value: true,
                                activeColor: AppColors.green900,
                                onChanged: (val) {},
                              ),

                              Expanded(
                                child: CustomText(
                                    bottom: 10,
                                    maxLines: 2,
                                    textAlign: TextAlign.left,
                                    text: controller.userPackageModel.value.data!.packageDetails![index].toString()
                                ),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
              ),
            );
        }
      }));
  }
}
