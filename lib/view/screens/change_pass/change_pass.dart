import 'package:dentist/utils/StaticString/static_string.dart';
import 'package:dentist/view/widgets/custom_button/custom_button.dart';
import 'package:dentist/view/widgets/custom_text/custom_text.dart';
import 'package:dentist/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';

class ChangePass extends StatelessWidget {
  const ChangePass({super.key});

  Widget textInfo(
          {required String key,
          required String hintText,
          required TextEditingController controller}) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: key,
              bottom: 10,
              fontSize: 16,
            ),
            CustomTextField(
              isPassword: true,
              textEditingController: controller,
              hintText: hintText,
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: AppStaticStrings.changePassword,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            children: [
              ///======================= Old Pass =======================

              textInfo(
                  controller: TextEditingController(),
                  hintText: AppStaticStrings.enterYourOldPass,
                  key: AppStaticStrings.oldPass),

              ///======================= New Pass =======================

              textInfo(
                  controller: TextEditingController(),
                  hintText: AppStaticStrings.enterYourNewPass,
                  key: AppStaticStrings.newPass),

              ///======================= Confirm Pass =======================

              textInfo(
                  controller: TextEditingController(),
                  hintText: AppStaticStrings.confirmPassword,
                  key: AppStaticStrings.confirmPass),

              ///======================= Update Button =======================
              const SizedBox(
                height: 40,
              ),
              CustomButton(
                title: AppStaticStrings.changePassword,
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
