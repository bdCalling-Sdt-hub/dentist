import 'package:dentist/core/app_routes/app_routes.dart';
import 'package:dentist/utils/AppColors/app_colors.dart';
import 'package:dentist/utils/StaticString/static_string.dart';
import 'package:dentist/view/screens/authentication/Controller/auth_controller.dart';
import 'package:dentist/view/widgets/custom_button/custom_button.dart';
import 'package:dentist/view/widgets/custom_loader/custom_loader.dart';
import 'package:dentist/view/widgets/custom_text/custom_text.dart';
import 'package:dentist/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthController>(builder: (controller) {
        return SafeArea(
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

                        CustomTextField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppStaticStrings.fieldCantBeEmpty;
                            } else if (!AppStaticStrings.emailRegexp.hasMatch(
                                controller.signInEmailController.text)) {
                              return "Enter a valid email";
                            } else {
                              return null;
                            }
                          },
                          textInputAction: TextInputAction.next,
                          textEditingController:
                              controller.signInEmailController,
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

                        CustomTextField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppStaticStrings.fieldCantBeEmpty;
                            } else {
                              return null;
                            }
                          },
                          isPassword: true,
                          textInputAction: TextInputAction.next,
                          textEditingController: controller.signInPinController,
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
                        CustomTextField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return AppStaticStrings.fieldCantBeEmpty;
                            }
                            // else if (value.length < 8 ||
                            //     !AppStaticStrings.passRegexp.hasMatch(value)) {
                            //   return AppStaticStrings.matchPettern;
                            // }
                            else {
                              return null;
                            }
                          },
                          textEditingController:
                              controller.signInPassController,
                          textInputAction: TextInputAction.done,
                          isPassword: true,
                          hintText: AppStaticStrings.enterYourPassword,
                        ),

                        SizedBox(
                          height: 16.h,
                        ),
                      ],
                    )),
                Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoute.forgotPassScreen);
                      },
                      child: CustomText(
                        text: "Forgot Password?",
                        fontWeight: FontWeight.w400,
                        fontSize: 12.h,
                        color: AppColors.redColor,
                        bottom: 30.h,
                      ),
                    )),

                ///<============================== Login Button ====================================>
                controller.signInLoading == true
                    ? CustomLoader()
                    : CustomButton(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            controller.signInUser();
                          }
                        },
                        title: AppStaticStrings.logIn,
                      ),
              ],
            ),
          ),
        ));
      }),
    );
  }
}
