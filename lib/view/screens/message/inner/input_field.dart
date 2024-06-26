import 'package:dentist/utils/AppColors/app_colors.dart';
import 'package:dentist/utils/StaticString/static_string.dart';
import 'package:dentist/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageInputField extends StatelessWidget {
  const MessageInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets,
      duration: const Duration(milliseconds: 100),
      curve: Curves.decelerate,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            //=============================== Gallery Button ==========================

            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.image_outlined,
                size: 36,
              ),
            ),
            //============================Text Input Field=====================

            Expanded(
                child: SizedBox(
              height: 50,
              child: CustomTextField(
                textInputAction: TextInputAction.done,
                hintText: AppStaticStrings.writeYourMessage,
                fieldBorderColor: AppColors.green900,
                focusBorderColor: AppColors.green900,
                fillColor: Colors.transparent,
                borderRadius: 10.r,
              ),
            )),

            //=============================== Send Button ==========================

            Container(
              margin: EdgeInsets.only(left: 4.w),
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: AppColors.green700),
              child: const Icon(
                Icons.send_sharp,
                color: AppColors.loght100,
              ),
            )
          ],
        ),
      ),
    );
  }
}
