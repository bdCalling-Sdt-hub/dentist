import 'dart:io';

import 'package:dentist/helper/GenerelError/general_error.dart';
import 'package:dentist/utils/AppColors/app_colors.dart';
import 'package:dentist/utils/AppConst/app_const.dart';
import 'package:dentist/utils/StaticString/static_string.dart';
import 'package:dentist/utils/ToastMsg/toast_message.dart';
import 'package:dentist/view/screens/message/controller/message_controller.dart';
import 'package:dentist/view/widgets/custom_loader/custom_loader.dart';
import 'package:dentist/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MessageInputField extends StatelessWidget {
      MessageInputField({super.key,
     required this.onTap,});

 MessageController controller=Get.find<MessageController>();

  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {

        return  Obx((){
          switch (controller.rxRequestStatus.value){
            case Status.loading:
              return const CustomLoader();
            case Status.internetError:
              return const CustomLoader();
            case Status.error:
              return GeneralErrorScreen(
                onTap: () {
                  //   homeController.getUserProfileData();
                },
              );
            case Status.completed:
              return    AnimatedPadding(
                padding: MediaQuery.of(context).viewInsets,
                duration: const Duration(milliseconds: 100),
                curve: Curves.decelerate,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [


                      ///============================== Image Pick Design ============================

                      controller.isComment.value==true && controller.generalController.imagePath.isNotEmpty?

                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        height: 120,
                        width: 220,
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.dark300),
                          borderRadius: BorderRadius.circular(8.r),
                          // image: DecorationImage(
                          //     //fit: BoxFit.cover,
                          //     image: FileImage(
                          //         File(generalController.imagePath.value)))
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                                height: 100,
                                width: 150,
                                child: Image.file(
                                    File(controller.generalController.imagePath.value))),
                            IconButton(
                                onPressed: () {
                                  controller.generalController.imagePath.value = "";
                                  controller.isComment.value=!controller.isComment.value;
                                  controller.update();
                                  controller.generalController.imagePath.refresh();
                                },
                                icon: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: AppColors.loght500)),
                                  child: const Icon(
                                    Icons.remove,
                                    color: AppColors.dark300,
                                  ),
                                )),
                          ],
                        ),
                      ):SizedBox(height: 1.h,),

                      Row(
                        children: [
                          ///=============================== Gallery Button ==========================
                          IconButton(
                            onPressed: () {
                              controller.isComment.value=!controller.isComment.value;
                              controller.update();
                              controller.generalController.selectImage();

                              print("This is commit value=      ${controller.isComment.value}");

                            },
                            icon: const Icon(
                              Icons.image_outlined,
                              size: 36,
                            ),
                          ),
                          ///============================Text Input Field=====================

                          Expanded(
                              child: SizedBox(
                                height: 50,
                                child: CustomTextField(
                                  textEditingController: controller.sendController.value,
                                  textInputAction: TextInputAction.done,
                                  hintText: AppStaticStrings.writeYourMessage,
                                  fieldBorderColor: AppColors.green900,
                                  focusBorderColor: AppColors.green900,
                                  fillColor: Colors.transparent,
                                  borderRadius: 10.r,
                                ),
                              )),

                          //=============================== Send Button ==========================

                          controller.sendLoading==true?CustomLoader():GestureDetector(
                            onTap:(){
                              if(controller.sendController.value.text.isNotEmpty==true || controller.generalController.imagePath.value.isNotEmpty==true){
                                controller.sendMessage();
                              }else{
                                toastMessage(message:"Please write something");
                              }
                            },
                            child: Container(
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
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
          }
        });





      }

  }

