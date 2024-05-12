import 'package:dentist/utils/StaticString/static_string.dart';
import 'package:dentist/view/widgets/custom_button/custom_button.dart';
import 'package:dentist/view/widgets/custom_text/custom_text.dart';
import 'package:dentist/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24.h,
              ),
              const CustomText(
                text: AppStaticStrings.welcomeBack,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.left,
                bottom: 20,
              ),

              const CustomText(
                text: AppStaticStrings.pleaseEnterYour,
                maxLines: 3,
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
              Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: AppStaticStrings.email,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        bottom: 16.h,
                        top: 40.h,
                      ),

                      ///<=======================================Email section======================================>

                      const CustomTextField(
                        // validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return AppStaticStrings.fieldCantBeEmpty;
                        //   } else if (!AppStaticStrings.emailRegexp
                        //       .hasMatch(controller.signInEmail.text)) {
                        //     return AppStaticStrings.enterValidEmail;
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        textInputAction: TextInputAction.next,
                        // textEditingController: controller.signInEmail,
                        hintText: AppStaticStrings.enterYourEmail,
                      ),

                      CustomText(
                        text: AppStaticStrings.pinNo,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        bottom: 16.h,
                        top: 16.h,
                      ),

                      ///<======================================= Pin Section======================================>

                      const CustomTextField(
                        // validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return AppStaticStrings.fieldCantBeEmpty;
                        //   } else if (!AppStaticStrings.emailRegexp
                        //       .hasMatch(controller.signInEmail.text)) {
                        //     return AppStaticStrings.enterValidEmail;
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        isPassword: true,
                        textInputAction: TextInputAction.next,
                        // textEditingController: controller.signInEmail,
                        hintText: AppStaticStrings.enterYourPinNum,
                      ),

                      ///<=======================================Password section======================================>

                      CustomText(
                        text: AppStaticStrings.password,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        top: 16.h,
                        bottom: 16.h,
                      ),
                      const CustomTextField(
                        // validator: (value) {
                        //   if (value.isEmpty) {
                        //     return AppStaticStrings.fieldCantBeEmpty;
                        //   } else if (value.length < 8 ||
                        //       !AppStaticStrings.passRegexp.hasMatch(value)) {
                        //     return AppStaticStrings.passwordLengthAndContain;
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        //textEditingController: controller.passWordSignIn,
                        textInputAction: TextInputAction.done,
                        isPassword: true,
                        hintText: AppStaticStrings.enterYourPassword,
                      ),

                      SizedBox(
                        height: 45.h,
                      ),
                    ],
                  )),

              ///<============================== Login Button ====================================>

              CustomButton(
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    //Get.toNamed(AppRoute.homeScreen);
                  }
                },
                title: AppStaticStrings.logIn,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
