import 'package:dentist/core/app_routes/app_routes.dart';
import 'package:dentist/utils/AppImg/app_img.dart';
import 'package:dentist/utils/StaticString/static_string.dart';
import 'package:dentist/view/widgets/condition_card/condition_card.dart';
import 'package:dentist/view/widgets/custom_text/custom_text.dart';
import 'package:dentist/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SkinCondition extends StatelessWidget {
  SkinCondition({super.key});

  final List<Map<String, String>> skinCondition = [
    {"img": AppImages.skin1, "title": "Antiwrinkle treatments and fillers"},
    {"img": AppImages.skin2, "title": "Facial and Peels"},
    {"img": AppImages.skin3, "title": "Fat Dissolving"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: AppStaticStrings.skinCondition,
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
              itemCount: skinCondition.length,
              itemBuilder: (context, index) {
                return ConditionCard(
                    img: skinCondition[index]["img"]!,
                    title: skinCondition[index]["title"]!,
                    onTap: () {
                      Get.toNamed(AppRoute.conditionDetails,
                          arguments: skinCondition[index]["title"]);
                    });
              },
            ))
          ],
        ),
      ),
    );
  }
}
