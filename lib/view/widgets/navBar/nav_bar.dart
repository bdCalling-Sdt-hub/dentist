import 'package:dentist/utils/AppColors/app_colors.dart';
import 'package:dentist/utils/AppIcons/app_icons.dart';
import 'package:dentist/utils/StaticString/static_string.dart';
import 'package:dentist/view/screens/home/home.dart';
import 'package:dentist/view/screens/my_plan/my_plan.dart';
import 'package:dentist/view/screens/profile/profile.dart';
import 'package:dentist/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NavBar extends StatefulWidget {
  final int currentIndex;

  const NavBar({required this.currentIndex, super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  var bottomNavIndex = 0;

  List<String> selectedText = [
    AppStaticStrings.home,
    AppStaticStrings.myPlan,
    AppStaticStrings.profile,
    AppStaticStrings.help,
  ];

  List<String> unselectedIcon = [
    AppIcons.homeUnselected,
    AppIcons.myPlanUnselected,
    AppIcons.profileUnselected,
    AppIcons.chat,
  ];

  List<String> selectedIcon = [
    AppIcons.homeSelected,
    AppIcons.myPlanSelected,
    AppIcons.profileSelected,
    AppIcons.chat,
  ];

  @override
  void initState() {
    bottomNavIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 4,
          ),
        ],
      ),

      height: 80.h,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w, vertical: 8.h),
      alignment: Alignment.center,
      // color: AppColors.greenNormalGreen4,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          unselectedIcon.length,
          (index) => InkWell(
            onTap: () => onTap(index),
            child: Padding(
              padding: const EdgeInsetsDirectional.all(2),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: index == bottomNavIndex ? AppColors.additional : null,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ///==================== Icon ===================

                    index == bottomNavIndex
                        ? SvgPicture.asset(
                            selectedIcon[index],
                            height: 18.w,
                          )
                        : SvgPicture.asset(
                            unselectedIcon[index],
                            height: 18.w,
                          ),

                    ///==================== Text ===================

                    CustomText(
                      left: index == bottomNavIndex ? 4 : 0,
                      top: 4.h,
                      color: AppColors.dark500,
                      fontSize: 10.h,
                      fontWeight: FontWeight.w400,
                      text: selectedText[index],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onTap(int index) {
    // HomeController homeController = Get.find<HomeController>();
    // homeController.scrollController.dispose();
    if (index == 0) {
      if (!(widget.currentIndex == 0)) {
        Get.offAll(() => HomeScreen());
      }
    } else if (index == 1) {
      if (!(widget.currentIndex == 1)) {
        Get.offAll(() => MyPlan());
      }
    } else if (index == 2) {
      if (!(widget.currentIndex == 2)) {
        Get.offAll(() => const ProfileScreen());
      }
    }
    //
    // else if (index == 3) {
    //   if (!(widget.currentIndex == 3)) {
    //     Get.to(() => const OfferScreen());
    //   }
    // }
  }
}
