import 'dart:convert';
import 'package:dentist/core/app_routes/app_routes.dart';
import 'package:dentist/helper/GenerelError/general_error.dart';
import 'package:dentist/helper/network_img/network_img.dart';
import 'package:dentist/service/api_url.dart';
import 'package:dentist/utils/AppColors/app_colors.dart';
import 'package:dentist/utils/AppConst/app_const.dart';
import 'package:dentist/utils/AppImg/app_img.dart';
import 'package:dentist/utils/StaticString/static_string.dart';
import 'package:dentist/view/screens/home/controller/homecontroller.dart';
import 'package:dentist/view/screens/home/inner/home_appbar.dart';
import 'package:dentist/view/screens/home/inner/side_drawer.dart';
import 'package:dentist/view/screens/notification/Controller/notification_controller.dart';
import 'package:dentist/view/widgets/custom_faq_design/custom_faq_design.dart';
import 'package:dentist/view/widgets/custom_image/custom_image.dart';
import 'package:dentist/view/widgets/custom_loader/custom_loader.dart';
import 'package:dentist/view/widgets/custom_text/custom_text.dart';
import 'package:dentist/view/widgets/expanded_animation/expanded_animation.dart';
import 'package:dentist/view/widgets/navBar/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> bannerImg = [
    AppImages.banner1,
    AppImages.banner2,
  ];
  final HomeController homeController = Get.find<HomeController>();
  // final List<String> currentOffer = [
  //   AppImages.currentOffer1,
  //   AppImages.currentOffer2,
  //   AppImages.currentOffer3,
  //   AppImages.currentOffer1,
  //   AppImages.currentOffer2,
  //   AppImages.currentOffer3,
  //   AppImages.currentOffer1,
  //   AppImages.currentOffer2,
  //   AppImages.currentOffer3,
  // ];

  Widget expertAdvice(
          {required String icon,
          required String title,
          required VoidCallback onTap}) =>
      Expanded(
          child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.loght600),
              borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.all(20.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomImage(
                imageSrc: icon,
                size: 40.r,
                imageType: ImageType.png,
              ),
              CustomText(top: 10.h, text: title)
            ],
          ),
        ),
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const SideDrawer(),
      bottomNavigationBar: const NavBar(currentIndex: 0),
      body: Obx(() {
        switch (homeController.rxRequestStatus.value) {
          case Status.loading:
            return const CustomLoader();
          case Status.internetError:
            return const CustomLoader();
          case Status.error:
            return GeneralErrorScreen(
              onTap: () {
                homeController.getUserProfileData();
              },
            );
          case Status.completed:
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///====================== Home AppBar =======================
                    HomeAppBar(scaffoldKey: scaffoldKey),

                    ///====================== Banner =======================

                    SizedBox(height: 16.h,),

                  Column(
                      children: [
                        if (homeController.bannerList.isNotEmpty)

                        CarouselSlider(

                          options: CarouselOptions(
                            height: 120.0.h,
                            autoPlay: true,
                            autoPlayCurve: Curves.ease,
                            pageSnapping: false,
                            //viewportFraction: 1,
                            onPageChanged: (int index, reason) {
                              homeController.bannerIndex.value = index;

                              homeController.pageController.value =
                                  PageController(
                                      initialPage:
                                          homeController.bannerIndex.value);
                            },
                          ),
                          items: homeController.bannerList.map((imagePath) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                margin: EdgeInsets.symmetric(horizontal: 10.w),
                                  width: 300.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(

                                              '${ApiConstant.baseUrl}${imagePath.bannerImage}'))),
                                );
                              },
                            );
                          }).toList(),
                        ),
                        // SizedBox(
                        //   height: 10.h,
                        // ),
                        SmoothPageIndicator(
                          controller: homeController.pageController.value,
                          count: homeController.bannerList.length,
                          axisDirection: Axis.horizontal,
                          effect: const ExpandingDotsEffect(
                            expansionFactor: 2,
                            spacing: 8.0,
                            dotWidth: 16.0,
                            dotHeight: 8.0,
                            paintStyle: PaintingStyle.fill,
                            strokeWidth: 1.5,
                            dotColor: AppColors.green200,
                            activeDotColor: AppColors.green600,
                          ),
                        ),
                      ],
                    ),

                    ///====================== Experts Advice =======================

                    const CustomText(
                      top: 16,
                      bottom: 8,
                      text: AppStaticStrings.expertsAdvice,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            homeController.articleCategoryModel.value.data!
                                .length, (index) {
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoute.dentalCondition, arguments: [
                                homeController.articleCategoryModel.value
                                        .data![index].articleCategoryName ??
                                    "",
                                true
                              ]);
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 16.w),
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.loght600),
                                  borderRadius: BorderRadius.circular(8)),
                              padding: EdgeInsets.all(20.r),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomNetworkImage(
                                      imageUrl:
                                          "${ApiConstant.baseUrl}${homeController.articleCategoryModel.value.data![index].articleCategoryImage ?? ""}",
                                      height: 70.h,
                                      width: 70.w),
                                  CustomText(
                                      top: 10.h,
                                      text: homeController
                                              .articleCategoryModel
                                              .value
                                              .data![index]
                                              .articleCategoryName ??
                                          "")
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),


                    const SizedBox(
                      height: 16,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(
                          text: AppStaticStrings.fAQ,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoute.faq);
                          },
                          child: const CustomText(
                            decoration: TextDecoration.underline,
                            text: AppStaticStrings.seeMore,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 16,
                    ),

                    ///======================= FAQ List =========================
                    // FaqDesign(),
                    Column(
                      children: List.generate(
                          homeController.faqModel.value.data!.length >= 5
                              ? 5
                              : homeController.faqModel.value.data?.length ?? 0,

                          //homeController.faqModel.value.data!.length,
                          (index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 15.h),
                          child: Column(
                            children: [
                              ///==================== Question Design =====================
                              GestureDetector(
                                onTap: () {
                                  if (homeController.selectedFqw.value ==
                                      index) {
                                    homeController.selectedFqw.value = 100000;
                                  } else {
                                    homeController.selectedFqw.value = index;
                                  }

                                  homeController.selectedFqw.refresh();
                                },
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          Border.all(color: AppColors.dark200)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: CustomText(
                                        textAlign: TextAlign.left,
                                        text: homeController.faqModel.value
                                                .data![index].question ??
                                            "",
                                        //faqList[index]["que"]!,
                                        fontWeight: FontWeight.w500,
                                      )),
                                      IconButton(
                                          onPressed: () {
                                            if (homeController
                                                    .selectedFqw.value ==
                                                index) {
                                              homeController.selectedFqw.value =
                                                  100000;
                                            } else {
                                              homeController.selectedFqw.value =
                                                  index;
                                            }

                                            homeController.selectedFqw
                                                .refresh();
                                          },
                                          icon: homeController
                                                      .selectedFqw.value ==
                                                  index
                                              ? const Icon(Icons
                                                  .keyboard_arrow_down_rounded)
                                              : const Icon(Icons
                                                  .keyboard_arrow_right_rounded))
                                    ],
                                  ),
                                ),
                              ),

                              ///==================== Ans Design =====================

                              index == homeController.selectedFqw.value
                                  ? CustomExpandedSection(
                                      expand: index ==
                                              homeController.selectedFqw.value
                                          ? true
                                          : false,
                                      child: Container(
                                        margin: const EdgeInsets.only(top: 8),
                                        padding: EdgeInsets.all(8.r),
                                        alignment: Alignment.center,
                                        height: 100.h,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: AppColors.additional
                                              .withOpacity(.4),
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                        ),
                                        child: CustomText(
                                          textAlign: TextAlign.left,
                                          text: homeController.faqModel.value
                                                  .data![index].answer ??
                                              "",
                                          //faqList[index]["ans"]!,
                                          maxLines: 6,
                                        ),
                                      ))
                                  : const SizedBox()
                            ],
                          ),
                        );
                      }),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(
                          text: AppStaticStrings.currentOffers,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoute.currentOffer);
                          },
                          child: const CustomText(
                            decoration: TextDecoration.underline,
                            text: AppStaticStrings.seeMore,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 16,
                    ),

                    ///========================== Current Offer =========================
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            homeController.offerModel.value.data!.length,
                            // currentOffer.length,
                            (index) {
                          return Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoute.offerDetails,
                                      arguments: homeController
                                          .offerModel.value.data![index].id
                                          .toString());

                                  print(homeController
                                      .offerModel.value.data![index].id
                                      .toString());
                                },
                                child: Container(
                                  height: 250.h,
                                  width: 150.w,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                      "${ApiConstant.baseUrl}/${homeController.offerModel.value.data![index].offerImage ?? ""}",
                                    ),
                                    // CustomNetworkImage(
                                    //     imageUrl:"${ApiConstant.baseUrl}/${homeController.offerModel.value.data![index].offerImage??""}",
                                    //     height: 250.h, width: 150.w)
                                  )),
                                ),
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                            ],
                          );
                        }),
                      ),
                    ),

                    const CustomText(
                      top: 16,
                      bottom: 16,
                      text: AppStaticStrings.smartCheck,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),

                    /// ====================== Smart Check =======================

                  if(homeController.smartCheckModel.value.data?.isNotEmpty==true)GestureDetector(
                      onTap: () async {
                        var url = homeController.smartCheckModel.value.data![0]
                                .smartCheckLink ??
                            "https://smartcheck.toothlens.com/Banning-dental/";
                        //"https://smartcheck.toothlens.com/Banning-dental/";
                        if (await canLaunchUrl(Uri.parse(url))) {
                          await launchUrl(Uri.parse(url));
                        } else {
                          // can't launch url, there is some error
                          throw "Could not launch $url";
                        }
                      },
                      child: CustomNetworkImage(
                          imageUrl:
                              "${ApiConstant.baseUrl}${homeController.smartCheckModel.value.data?[0].smartCheckImage??""}",
                          height: 120.h,
                          width: 350.w),
                    ),

                    const SizedBox(
                      height: 44,
                    ),
                  ],
                ),
              ),
            );
        }
      }),
    );
  }
}
