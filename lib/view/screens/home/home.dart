import 'package:dentist/core/app_routes/app_routes.dart';
import 'package:dentist/utils/AppColors/app_colors.dart';
import 'package:dentist/utils/AppImg/app_img.dart';
import 'package:dentist/utils/StaticString/static_string.dart';
import 'package:dentist/view/screens/home/controller/homecontroller.dart';
import 'package:dentist/view/screens/home/inner/home_appbar.dart';
import 'package:dentist/view/widgets/custom_faq_design/custom_faq_design.dart';
import 'package:dentist/view/widgets/custom_image/custom_image.dart';
import 'package:dentist/view/widgets/custom_text/custom_text.dart';
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

  final List<Map<String, String>> faqList = [
    {
      "que": "How dose this app work?",
      "ans": "This is an dummy answer, To show in UI"
    },
    {
      "que": "How can i cancle my order",
      "ans": "This is an dummy answer, To show in UI"
    },
    {
      "que": "Is my data secure?",
      "ans":
          "This is an dummy answer, To show in UI, This is an dummy answer, To show in UI, This is an dummy answer, To show in UI, "
    },
  ];

  final List<String> currentOffer = [
    AppImages.currentOffer1,
    AppImages.currentOffer2,
    AppImages.currentOffer3,
    AppImages.currentOffer1,
    AppImages.currentOffer2,
    AppImages.currentOffer3,
    AppImages.currentOffer1,
    AppImages.currentOffer2,
    AppImages.currentOffer3,
  ];
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
      bottomNavigationBar: const NavBar(currentIndex: 0),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///====================== Home AppBar =======================
              HomeAppBar(scaffoldKey: scaffoldKey),

              ///====================== Banner =======================
              Obx(() => Column(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 160.0.h,
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
                        items: bannerImg.map((imagePath) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: 300.w,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(imagePath))),
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
                        count: bannerImg.length,
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
                  )),

              ///====================== Experts Advice =======================
              const CustomText(
                top: 16,
                bottom: 8,
                text: AppStaticStrings.expertsAdvice,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),

              Row(
                children: [
                  ///================= Dental Condition ===================
                  expertAdvice(
                      onTap: () {
                        Get.toNamed(AppRoute.dentalCondition);
                      },
                      icon: AppImages.dentalCondition,
                      title: AppStaticStrings.dentalCondition),
                  SizedBox(
                    width: 10.w,
                  ),

                  ///================= Skin Care ===================

                  expertAdvice(
                      onTap: () {
                        Get.toNamed(AppRoute.skinCondition);
                      },
                      icon: AppImages.skinCare,
                      title: AppStaticStrings.skinCondition)
                ],
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
              FaqDesign(faqList: faqList),

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: AppStaticStrings.currentOffers,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomText(
                    decoration: TextDecoration.underline,
                    text: AppStaticStrings.seeMore,
                    fontSize: 14,
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
                  children: List.generate(currentOffer.length, (index) {
                    return CustomImage(
                      fit: BoxFit.cover,
                      sizeWidth: 100.w,
                      imageSrc: currentOffer[index],
                      imageType: ImageType.png,
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

              GestureDetector(
                onTap: () async {
                  const url = "https://toothlens.com/";
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  } else {
                    // can't launch url, there is some error
                    throw "Could not launch $url";
                  }
                },
                child: const CustomImage(
                  fit: BoxFit.cover,
                  imageSrc: AppImages.banner1,
                  imageType: ImageType.png,
                ),
              ),

              const SizedBox(
                height: 44,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
