import 'package:dentist/utils/AppColors/app_colors.dart';
import 'package:dentist/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConditionCard extends StatelessWidget {
  const ConditionCard(
      {super.key, required this.img, required this.title, required this.onTap});
  final String img;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColors.dark100)),
        child: Row(
          children: [
            ///=====================- Img =====================
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(60),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    image: DecorationImage(image: AssetImage(img)))),

            ///=====================- Text =====================

            Expanded(
                child: CustomText(
              textAlign: TextAlign.left,
              text: title,
              maxLines: 3,
            ))
          ],
        ),
      ),
    );
  }
}
