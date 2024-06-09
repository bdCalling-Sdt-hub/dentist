import 'package:dentist/core/app_routes/app_routes.dart';
import 'package:dentist/helper/GenerelError/general_error.dart';
import 'package:dentist/service/api_url.dart';
import 'package:dentist/utils/AppConst/app_const.dart';
import 'package:dentist/utils/StaticString/static_string.dart';
import 'package:dentist/view/screens/dentalCondition/Controller/article_controller.dart';
import 'package:dentist/view/screens/no_internet/no_internet.dart';
import 'package:dentist/view/widgets/condition_card/condition_card.dart';
import 'package:dentist/view/widgets/custom_loader/custom_loader.dart';
import 'package:dentist/view/widgets/custom_text/custom_text.dart';
import 'package:dentist/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  ArticleController articleController = Get.find<ArticleController>();
  @override
  void initState() {
    articleController.getArticleByCategory("", false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: AppStaticStrings.search,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Obx(() {
        switch (articleController.rxRequestStatus.value) {
          case Status.loading:
            return const CustomLoader();
          case Status.internetError:
            return NoInternetScreen(onTap: () {
              articleController.getArticleByCategory("", false);
            });
          case Status.error:
            return GeneralErrorScreen(
              onTap: () {
                articleController.getArticleByCategory("", false);
              },
            );
          case Status.completed:
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                children: [
                  CustomTextField(
                    onSubmit: (value) {
                      articleController.getArticleByCategory(value, false);
                    },
                    hintText: AppStaticStrings.searchhere,
                    isPrefixIcon: true,
                  ),
                  SizedBox(height: 5.h),
                  Expanded(
                      child: ListView.builder(
                    itemCount:
                        articleController.articleModel.value.data?.length ?? 0,
                    //articleController.articleModel.value.data?.length,
                    itemBuilder: (context, index) {
                      return ConditionCard(
                          img:
                              "${ApiConstant.baseUrl}${articleController.articleModel.value.data![index].buttonImage ?? ""}",
                          title: articleController.articleModel.value
                                  .data![index].articleName ??
                              "",
                          onTap: () {
                            Get.toNamed(AppRoute.conditionDetails, arguments: [
                              articleController
                                      .articleModel.value.data![index].id ??
                                  "",
                              articleController.articleModel.value.data![index]
                                      .articleName ??
                                  ""
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
