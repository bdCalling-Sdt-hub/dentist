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
                text:
                    "Dental Hygiene & The Role of Regular Visits at Banning Dental Group",
                fontSize: 14,
                maxLines: 2,
                bottom: 16,
                textAlign: TextAlign.left,
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
                    "Maintaining oral health is a critical component of overall wellbeing. Regular visits to a dental hygienist, like those provided by the Banning Dental Group, offer comprehensive care that goes beyond just keeping your teeth clean. These appointments are crucial for preventing dental issues and ensuring long-term dental health. When you visit a dental hygienist, you receive thorough cleanings that remove plaque and tartar buildup. Such accumulations, if left unchecked, can lead to gum disease and tooth decay—common conditions that can be both painful and expensive to treat. The hygienist's specialized tools clean areas of your mouth that regular brushing and flossing might miss. Moreover, dental hygienists are pivotal in spotting early signs of oral problems. Early detection can lead to simpler and less costly treatments. Dental hygienists can also offer tailored advice for at-home care, including brushing techniques and suitable products, ensuring your personal routine is as effective as possible. Education is another significant aspect of a dental hygienist's role. Understanding the effects of diet, lifestyle choices, and other factors on oral health can empower you to make better decisions for your teeth and gums. For example, learning about the impact of smoking or sugar on oral health can motivate behavior change for enhanced overall health. At Banning Dental Group, consistency in visiting dental hygienists ensures that any changes in your oral health are recorded and monitored. This way, the hygienist and dentist can work together to adjust treatment plans promptly, maintaining optimal oral health. In short, dental hygienists are essential allies in the fight against gum disease, tooth decay, and other oral conditions. Their expertise contributes to a healthier smile and a healthier you. Regular appointments at Banning Dental Group can save you from future discomfort and expensive dental procedures, while also providing a foundation for a lifetime of healthy smiles.",
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
