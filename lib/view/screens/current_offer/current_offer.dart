import 'package:dentist/core/app_routes/app_routes.dart';
import 'package:dentist/utils/AppImg/app_img.dart';
import 'package:dentist/utils/StaticString/static_string.dart';
import 'package:dentist/view/widgets/custom_image/custom_image.dart';
import 'package:dentist/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CurrentOffer extends StatelessWidget {
  CurrentOffer({super.key});

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: AppStaticStrings.currentOffers,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        itemCount: currentOffer.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 250,
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.toNamed(AppRoute.offerDetails,
                  arguments: currentOffer[index]);
            },
            child: CustomImage(
              fit: BoxFit.fill,
              sizeWidth: 100.w,
              imageSrc: currentOffer[index],
              imageType: ImageType.png,
            ),
          );
        },
      ),
    );
  }
}
