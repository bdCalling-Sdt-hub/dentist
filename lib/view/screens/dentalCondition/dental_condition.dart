import 'package:dentist/core/app_routes/app_routes.dart';
import 'package:dentist/utils/AppImg/app_img.dart';
import 'package:dentist/utils/StaticString/static_string.dart';
import 'package:dentist/view/widgets/condition_card/condition_card.dart';
import 'package:dentist/view/widgets/custom_text/custom_text.dart';
import 'package:dentist/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DentalCondition extends StatelessWidget {
  DentalCondition({super.key});

  final List<Map<String, String>> dentalCondition = [
    {"img": AppImages.dental1, "title": "Hygienist"},
    {"img": AppImages.dental2, "title": "Composite Bonding"},
    {"img": AppImages.dental3, "title": "Implants"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: AppStaticStrings.dentalCondition,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 24, left: 20, right: 20),
        child: Column(
          children: [
            ///======================== Search Button ========================

            const CustomTextField(
              isPrefixIcon: true,
            ),
            SizedBox(
              height: 20.h,
            ),

            ///======================== Condition List ========================

            Expanded(
                child: ListView.builder(
              itemCount: dentalCondition.length,
              itemBuilder: (context, index) {
                return ConditionCard(
                    img: dentalCondition[index]["img"]!,
                    title: dentalCondition[index]["title"]!,
                    onTap: () {
                      Get.toNamed(AppRoute.conditionDetails,
                          arguments: dentalCondition[index]["title"]);
                    });
              },
            ))
          ],
        ),
      ),
    );
  }
}
