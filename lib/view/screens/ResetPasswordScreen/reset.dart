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

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context){
    return Scaffold(
       appBar: AppBar(),
        body:  GetBuilder<AuthController>(
          builder: (controller) {
            return Center(
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: 24.h,horizontal: 20.w),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ///==============================Reset Password code ===========================
                        CustomText(
                          text:"Reset Password",
                          fontSize: 24.w,
                          fontWeight: FontWeight.w500,
                          color: AppColors.green500,
                          bottom: 12.h,
                        ),

                        ///==============================Personal data  Text===========================
                        CustomText(
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          text:"Please enter your personal data",
                          fontSize: 14.w,
                        ),

                        SizedBox(
                          height: 12.h,
                        ),

                        ///<============================= This is divider section =======================>

                        Container(
                        height: 1.h,
                        width: double.maxFinite,
                        color:AppColors.dividerColor,
                        ),

                        SizedBox(height: 24.h,),

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
                            } else if (value.length < 8 ||
                                !AppStaticStrings.passRegexp.hasMatch(value)) {
                              return AppStaticStrings.matchPettern;
                            }
                            else {
                              return null;
                            }
                          },
                          textEditingController: controller.resetPassController,
                          textInputAction: TextInputAction.done,
                          isPassword: true,
                          hintText: AppStaticStrings.enterYourPassword,
                        ),

                         SizedBox(height: 16.h,),

                        CustomText(
                          text: AppStaticStrings.confirmPass,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          top: 16.h,
                          bottom: 16.h,
                        ),

                         CustomTextField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return AppStaticStrings.fieldCantBeEmpty;
                            } else if (value!=controller.resetPassController.text){
                              return "Password didn't match";
                            }
                            else {
                              return null;
                            }
                          },
                          textEditingController: controller.resetConfirmPassController,
                          textInputAction: TextInputAction.done,
                          isPassword: true,
                          hintText: AppStaticStrings.enterYourPassword,
                        ),

                        SizedBox(height: 24.h,),


                        ///<=====================  button ========================>

                       controller.signInLoading==true? const CustomLoader():CustomButton(
                          onTap: () async{
                            if (formKey.currentState!.validate()){
                            controller.handleResetPassword();
                            }
                          },
                          title:"Update Password",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        ),
    );
  }
}
