import 'package:dentist/core/app_routes/app_routes.dart';
import 'package:dentist/helper/GenerelError/general_error.dart';
import 'package:dentist/service/api_url.dart';
import 'package:dentist/utils/AppConst/app_const.dart';
import 'package:dentist/utils/AppImg/app_img.dart';
import 'package:dentist/view/screens/dentalCondition/Controller/article_controller.dart';
import 'package:dentist/view/screens/no_internet/no_internet.dart';
import 'package:dentist/view/widgets/condition_card/condition_card.dart';
import 'package:dentist/view/widgets/custom_loader/custom_loader.dart';
import 'package:dentist/view/widgets/custom_text/custom_text.dart';
import 'package:dentist/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DentalCondition extends StatefulWidget {
  DentalCondition({super.key});

  @override
  State<DentalCondition> createState() => _DentalConditionState();
}

class _DentalConditionState extends State<DentalCondition> {

  var name = Get.arguments[0];

  var category = Get.arguments[1];

  ArticleController articleController = Get.find<ArticleController>();

  // final List<Map<String, String>> dentalCondition = [
  //   {"img": AppImages.dental1, "title": "Hygienist"},
  //   {"img": AppImages.dental2, "title": "Composite Bonding"},
  //   {"img": AppImages.dental3, "title": "Implants"},
  // ];

  @override
  void initState() {
    articleController.getArticleByCategory(name,category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomText(
          text: "Condition",
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Obx(() {
        switch (articleController.rxRequestStatus.value) {
          case Status.loading:
            return const CustomLoader();
          case Status.internetError:
            return NoInternetScreen(onTap: (){
              articleController.getArticleByCategory(name,false);
            });
          case Status.error:
            return GeneralErrorScreen(
              onTap: () {
                articleController.getArticleByCategory(name,category);
              },
            );
          case Status.completed:
            return Padding(
              padding: const EdgeInsets.only(top: 24, left: 20, right: 20),
              child: Column(
                children: [
                  ///======================== Search Button ========================
                   CustomTextField(
                     textInputAction: TextInputAction.done,
                    isPrefixIcon: true,
                    onSubmit: (value){
                    articleController.getArticleByCategory(value, false);

                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),

                  ///======================== Condition List ========================

                  Expanded(
                      child: ListView.builder(
                    itemCount:articleController.articleModel.value.data?.length,
                    //dentalCondition.length,
                    itemBuilder: (context, index){
                      return ConditionCard(
                          img:
                            "${ApiConstant.baseUrl}${articleController.articleModel.value.data![index].buttonImage ?? ""}",
                            title: articleController.articleModel.value
                            .data![index].articleName??"",
                            onTap: () {
                            Get.toNamed(AppRoute.conditionDetails,
                            arguments:[articleController.articleModel.value
                                 .data![index].id??"",
                                  articleController.articleModel.value
                                 .data![index].articleName??""
                            ]);
                          });
                    },
                  ))
                ],
              ),
            );
        }
      }),
    );
  }
}
