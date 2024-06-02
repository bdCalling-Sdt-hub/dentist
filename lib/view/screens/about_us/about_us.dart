import 'package:dentist/helper/GenerelError/general_error.dart';
import 'package:dentist/utils/AppConst/app_const.dart';
import 'package:dentist/utils/StaticString/static_string.dart';
import 'package:dentist/view/screens/about_us/Controller/about_us_controller.dart';
import 'package:dentist/view/widgets/custom_loader/custom_loader.dart';
import 'package:dentist/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

class AboutUs extends StatelessWidget {
   AboutUs({super.key});

  AboutUsController controller=Get.find<AboutUsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: AppStaticStrings.aboutUs,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),

      body:Obx(() {
        switch (controller.rxRequestStatus.value) {
          case Status.loading:
            return const CustomLoader();
          case Status.internetError:
            return const CustomLoader();
          case Status.error:
            return GeneralErrorScreen(
              onTap: () {
                controller.getAboutUs();
              },
            );
          case Status.completed:
            return controller.aboutUsModel.value.data!=null? SingleChildScrollView(
              child
                  : Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),

                child: Column(
                  children: [
                    controller.aboutUsModel.value.data!.content!.isNotEmpty==true?
                    HtmlWidget(
                        controller.aboutUsModel.value.data!.content??""
                    ):
                    const Center(
                      child: CustomText(
                        text:"Not  data found ",
                      ),
                    ),
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
