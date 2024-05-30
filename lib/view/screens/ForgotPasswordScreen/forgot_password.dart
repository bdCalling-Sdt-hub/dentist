import 'package:dentist/core/app_routes/app_routes.dart';
import 'package:dentist/utils/AppColors/app_colors.dart';
import 'package:dentist/utils/StaticString/static_string.dart';
import 'package:dentist/view/screens/authentication/Controller/auth_controller.dart';
import 'package:dentist/view/widgets/custom_button/custom_button.dart';
import 'package:dentist/view/widgets/custom_text/custom_text.dart';
import 'package:dentist/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
   ForgotPasswordScreen({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        ),
        body: GetBuilder<AuthController>(
          builder: (controller) {
            return SingleChildScrollView(
             padding: EdgeInsets.symmetric(
               horizontal: 25.w
             ),
              child: Form(
                key: formKey,
                child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                    ///<=================================== This is Title Text =============================>

                 CustomText(text:AppStaticStrings.emailConfirmation,
                 fontWeight: FontWeight.w700,
                 fontSize: 24.sp,
                 color: AppColors.green500,
                 top: 136.h,

                 ),
                    ///<=============================== This is subtitle Text ===============================>

                 CustomText(text:"Enter your email of phone no for varification",
                 fontWeight: FontWeight.w400,
                 textAlign: TextAlign.start,
                 maxLines: 2,
                 fontSize:14.sp,
                 color: AppColors.dark300,
                 top: 14.h,
                 bottom: 14.h,
                 ),

                    ///<========================= This is  divider section ==================================>

                 Container(
                 height: 1.h,
                 width: double.maxFinite,
                 color: AppColors.dividerColor,
                 ),

                 SizedBox(height: 24.h,),

                 CustomText(
                     text: AppStaticStrings.email,
                     fontSize: 16,
                     fontWeight: FontWeight.w400,
                     bottom: 16.h,

                   ),

                   ///<=======================================Email section======================================>

                  CustomTextField(
                     validator: (value) {
                       if (value!.isEmpty) {
                         return AppStaticStrings.fieldCantBeEmpty;
                       }
                       else if (!AppStaticStrings.emailRegexp
                           .hasMatch(controller.forgotEmailController.text)) {
                         return "Enter a valid email";
                       }
                       else {
                         return null;
                       }
                     },
                     textInputAction: TextInputAction.next,
                      textEditingController: controller.forgotEmailController,
                     hintText: AppStaticStrings.enterYourEmail,
                   ),

                 SizedBox(height: 24.h,),

                 CustomButton(
                     onTap: () async {
                       if (formKey.currentState!.validate()){
                         controller.handleForgetPassword();
                       }
                     },
                     title:"Send verification code",
                   ),
                 ],
                ),
              ),
            );
          }
        ),

    );
  }
}
