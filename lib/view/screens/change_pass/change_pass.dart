import 'package:dentist/utils/StaticString/static_string.dart';
import 'package:dentist/view/screens/authentication/Controller/auth_controller.dart';
import 'package:dentist/view/widgets/custom_button/custom_button.dart';
import 'package:dentist/view/widgets/custom_loader/custom_loader.dart';
import 'package:dentist/view/widgets/custom_text/custom_text.dart';
import 'package:dentist/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePass extends StatelessWidget {
   ChangePass({super.key});

  AuthController authControllers=Get.find<AuthController>();
   final formKey = GlobalKey<FormState>();
  Widget textInfo(
          {required String key,
          required String hintText,
          required TextEditingController controller,
          required String? Function(dynamic)? validator
          }) =>
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
              validator: validator,
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
      body: GetBuilder<AuthController>(
        builder: (controllers) {
          return SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                child: Column(
                  children: [
                    ///======================= Old Pass =======================

                    textInfo(
                        validator: (value){
                            if (value.isEmpty) {
                              return AppStaticStrings.fieldCantBeEmpty;
                            }
                            else {
                             return null;
                            }
                        },
                        controller: controllers.oldPassController,
                        hintText: AppStaticStrings.enterYourOldPass,
                        key: AppStaticStrings.oldPass),

                    ///======================= New Pass =======================

                    textInfo(
                        validator: (value){
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
                        controller: controllers.newPassController,
                        hintText: AppStaticStrings.enterYourNewPass,
                        key: AppStaticStrings.newPass),

                    ///======================= Confirm Pass =======================

                    textInfo(
                        validator: (value){
                          if (value.isEmpty) {
                            return AppStaticStrings.fieldCantBeEmpty;
                          } else if (value!=controllers.newPassController.text){
                            return "Password didn't match";
                          }
                          else {
                            return null;
                          }
                        },
                        controller:controllers.confirmNewPassController,
                        hintText: AppStaticStrings.confirmPassword,
                        key: AppStaticStrings.confirmPass),

                    ///======================= Update Button =======================
                    const SizedBox(
                      height: 40,
                    ),
                controllers.signInLoading==true?CustomLoader():CustomButton(
                      title: AppStaticStrings.changePassword,
                      onTap: () {
                        if (formKey.currentState!.validate()){
                          print("hiiiii");
                          controllers.changePassword();
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
