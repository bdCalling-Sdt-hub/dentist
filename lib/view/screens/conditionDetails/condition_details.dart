import 'package:dentist/helper/network_img/network_img.dart';
import 'package:dentist/utils/AppConst/app_const.dart';
import 'package:dentist/utils/AppIcons/app_icons.dart';
import 'package:dentist/utils/StaticString/static_string.dart';
import 'package:dentist/view/widgets/custom_image/custom_image.dart';
import 'package:dentist/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ConditionDetails extends StatelessWidget {
  ConditionDetails({super.key});

  final String title = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          maxLines: 2,
          text: title,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///=========================== Title ========================

              const CustomText(
                text: "Toothache why and how ?",
                fontSize: 14,
                bottom: 16,
              ),

              ///========================= Post Image ======================

              CustomNetworkImage(
                  borderRadius: BorderRadius.circular(16.r),
                  imageUrl: AppConstants.teethHelth,
                  height: 200.h,
                  width: double.maxFinite),

              ///=========================== Description ========================

              const CustomText(
                top: 16,
                textAlign: TextAlign.justify,
                maxLines: 100,
                text:
                    "You've made a dentist appointment, and it can't come soon enough. Meanwhile, it can help to rinse your mouth with warm water, floss to remove food caught between teeth, and take an over-the-counter pain reliever. If you notice swelling or pus around the tooth, or if you have a fever, that could be a sign that you have an abscess, a more serious problem. See your dentist as soon as possible. You may need antibiotics as well as other treatments.Why Does My Tooth Hurt? Whether it's sharp and sudden or dull and constant, tooth pain is hard to ignore. A toothache or tooth pain is caused when the nerve in the root of a tooth or surrounding a tooth is irritated. Dental (tooth) infection, decay, injury, or loss of a tooth are the most common causes of dental pain. Pain may also occur after an extraction (when a tooth is pulled out). Pain sometimes comes from other areas and goes to the jaw, thus appearing to be tooth pain. The most common areas include the jaw joint (temporomandibular joint, or TMJ), ear, sinuses, and even occasionally from heart problems.Bacteria growing inside your mouth can contribute to gum disease and dental decay, both of which can cause pain. Often, gum disease will not result in any pain.",
                fontSize: 14,
                bottom: 16,
              ),

              ///============================ Buttons ===========================
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ///========================== Call Button =======================

                    IconButton(
                      onPressed: () {},
                      icon: const Row(
                        children: [
                          CustomImage(
                            imageSrc: AppIcons.call,
                            size: 20,
                          ),
                          CustomText(left: 5, text: AppStaticStrings.call)
                        ],
                      ),
                    ),

                    ///========================== Chat Button =======================

                    IconButton(
                      onPressed: () {},
                      icon: const Row(
                        children: [
                          CustomImage(
                            imageSrc: AppIcons.chat,
                            size: 20,
                          ),
                          CustomText(left: 5, text: AppStaticStrings.chat)
                        ],
                      ),
                    ),

                    ///========================== Gmail Button =======================

                    IconButton(
                      onPressed: () {},
                      icon: const Row(
                        children: [
                          CustomImage(
                            imageSrc: AppIcons.mail,
                            size: 15,
                          ),
                          CustomText(left: 5, text: AppStaticStrings.mail)
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
