import 'package:dentist/core/app_routes/app_routes.dart';
import 'package:dentist/helper/GenerelError/general_error.dart';
import 'package:dentist/helper/network_img/network_img.dart';
import 'package:dentist/service/api_url.dart';
import 'package:dentist/utils/AppColors/app_colors.dart';
import 'package:dentist/utils/AppConst/app_const.dart';
import 'package:dentist/utils/AppIcons/app_icons.dart';
import 'package:dentist/utils/StaticString/static_string.dart';
import 'package:dentist/view/screens/conditionDetails/Controller/article_details_controller.dart';
import 'package:dentist/view/screens/dentalCondition/Controller/article_controller.dart';
import 'package:dentist/view/screens/message/message.dart';
import 'package:dentist/view/widgets/custom_image/custom_image.dart';
import 'package:dentist/view/widgets/custom_loader/custom_loader.dart';
import 'package:dentist/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ConditionDetails extends StatefulWidget {
  ConditionDetails({super.key});

  @override
  State<ConditionDetails> createState() => _ConditionDetailsState();
}

class _ConditionDetailsState extends State<ConditionDetails> {
  ArticleDetailsController articleDetailsController=Get.find<ArticleDetailsController>();

  PageController controller=PageController();

  final String title = Get.arguments[1];

  var id=Get.arguments[0];

  @override
  void initState() {
    articleDetailsController.getArticleDetails(id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          maxLines: 2,
          text:title,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),

      body:  Obx(() {
        switch (articleDetailsController.rxRequestStatus.value) {
          case Status.loading:
            return const CustomLoader();
          case Status.internetError:
            return const CustomLoader();
          case Status.error:
            return GeneralErrorScreen(
              onTap: () {
                articleDetailsController.getArticleDetails(id);
              },
            );
          case Status.completed:
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///=========================== Title ========================

                    const CustomText(
                      text:
                      "",
                      fontSize: 14,
                      maxLines: 2,
                      bottom: 16,
                      textAlign: TextAlign.left,
                    ),

                    ///========================= Post Image ======================
                    Container(
                      height:250.h,
                      width: double.maxFinite,
                      child: Stack(
                        children: [
                          PageView.builder(
                              onPageChanged: (value){
                                articleDetailsController.currentImage.value=value+1;

                                articleDetailsController.currentImage.refresh();

                                print("=========================== this is image index =-=-=   ${articleDetailsController.currentImage}");
                              },
                              itemCount:articleDetailsController.artiCleDetailsModel.value.data!.articleSlider?.length,
                              controller:controller,
                              itemBuilder:(context, index){
                                return Container(
                                  margin: EdgeInsets.only(right: 8.w),
                                  height: 200.h,
                                  width:330,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit:BoxFit.fill,
                                      image: NetworkImage(
                                      "${ApiConstant.baseUrl}${articleDetailsController.artiCleDetailsModel.value.data!.articleSlider![index].toString()}"
                                      ),
                                    ),
                                    borderRadius:BorderRadius.circular(8),
                                    border: Border.all(color: AppColors.loght600),
                                  ),
                                );
                              }),
                            Positioned(
                            top:200,
                            left: 300,
                            child:CustomText(
                              text:"${articleDetailsController.currentImage}/${articleDetailsController.artiCleDetailsModel.value.data!.articleSlider?.length}",
                              color:AppColors.loght50,fontSize: 18,),
                          ),
                        ],
                      ),
                    ),
                    ///=========================== Description ========================

                      CustomText(
                      top: 16,
                      textAlign: TextAlign.justify,
                      maxLines: 100,
                      text:articleDetailsController.artiCleDetailsModel.value.data?.articleDetails??"",
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
                            onPressed: () {
                             articleDetailsController.getContact();
                             print("Hiiiiiiiiiiiiiii");
                            },
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
                            onPressed: () {
                              Get.to(() => MessageScreen());
                            },
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
                            onPressed: () {
                           articleDetailsController.sendEmailToAdmin();
                            },
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
            );
        }
      }),

    );
  }
}
