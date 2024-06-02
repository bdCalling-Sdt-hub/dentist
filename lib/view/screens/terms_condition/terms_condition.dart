import 'package:dentist/helper/GenerelError/general_error.dart';
import 'package:dentist/utils/AppConst/app_const.dart';
import 'package:dentist/utils/StaticString/static_string.dart';
import 'package:dentist/view/screens/terms_condition/Controller/terms_condition_controller.dart';
import 'package:dentist/view/widgets/custom_loader/custom_loader.dart';
import 'package:dentist/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

class TermsCondition extends StatelessWidget {
   TermsCondition({super.key});
  TermsConditionController controller=Get.find<TermsConditionController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: AppStaticStrings.termsConditions,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),

      body:
      Obx(() {
        switch (controller.rxRequestStatus.value) {
          case Status.loading:
            return const CustomLoader();
          case Status.internetError:
            return const CustomLoader();
          case Status.error:
            return GeneralErrorScreen(
              onTap: () {
                controller.getTermsCondition();
              },
            );
          case Status.completed:
            return controller.termsConditionModel.value.data!=null?  SingleChildScrollView(
              child
                  : Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),

                child: Column(
                  children: [
                    controller.termsConditionModel.value.data!.content!.isNotEmpty==true?
                    HtmlWidget(
                        controller.termsConditionModel.value.data!.content??""

                    ):

                    Center(
                      child: CustomText(
                        text:"Not  data found ",
                      ),
                    ),




                    // const CustomText(
                    //     textAlign: TextAlign.left,
                    //     maxLines: 10,
                    //     text:
                    //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                    // CustomText(
                    //     top: 30.h,
                    //     textAlign: TextAlign.left,
                    //     maxLines: 10,
                    //     text:
                    //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                    // CustomText(
                    //     top: 30.h,
                    //     textAlign: TextAlign.left,
                    //     maxLines: 10,
                    //     text:
                    //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                  ],
                ),

              ),
            ) : const Center(
              child: CustomText(text: 'Empty',fontWeight: FontWeight.w500,),
            );
        }
      }),


    );
  }
}
