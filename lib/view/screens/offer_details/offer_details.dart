import 'package:dentist/utils/StaticString/static_string.dart';
import 'package:dentist/view/widgets/custom_image/custom_image.dart';
import 'package:dentist/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OfferDetails extends StatelessWidget {
  OfferDetails({super.key});

  final String image = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: AppStaticStrings.currentOffersDetails,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 24, left: 20, right: 20),
        child: Column(
          children: [
            ///==================== Image =====================
            Align(
              alignment: Alignment.center,
              child: CustomImage(
                fit: BoxFit.fill,
                sizeWidth: 100.w,
                imageSrc: image,
                imageType: ImageType.png,
              ),
            ),

            ///==================== Description =====================
            CustomText(
                top: 20.h,
                textAlign: TextAlign.justify,
                maxLines: 50,
                text:
                    "Take care of your  smile with 25% discount Only available until xxxxxx Cannot be redeemed with other offers Only available for the exclusive use of the member You must redeem this offer by contacting us xxxxx")
          ],
        ),
      ),
    );
  }
}
