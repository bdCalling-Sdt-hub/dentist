// import 'package:dentist/helper/GenerelError/general_error.dart';
// import 'package:dentist/helper/network_img/network_img.dart';
// import 'package:dentist/service/api_url.dart';
// import 'package:dentist/utils/AppConst/app_const.dart';
// import 'package:dentist/utils/StaticString/static_string.dart';
// import 'package:dentist/view/screens/home/Mdel/offer_model.dart';
// import 'package:dentist/view/screens/home/controller/homecontroller.dart';
// import 'package:dentist/view/widgets/custom_image/custom_image.dart';
// import 'package:dentist/view/widgets/custom_loader/custom_loader.dart';
// import 'package:dentist/view/widgets/custom_text/custom_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
// class OfferDetails extends StatefulWidget {
//   OfferDetails({super.key});
//
//   @override
//   State<OfferDetails> createState() => _OfferDetailsState();
// }
//
// class _OfferDetailsState extends State<OfferDetails> {
//   HomeController homeController = Get.find<HomeController>();
//
//   final String id = Get.arguments;
//
//   @override
//   void initState() {
//     homeController.getOfferDetails(id);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const CustomText(
//           text: AppStaticStrings.currentOffersDetails,
//           fontSize: 18,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//       body: Obx(() {
//         switch (homeController.rxRequestStatus.value) {
//           case Status.loading:
//             return const CustomLoader();
//           case Status.internetError:
//             return const CustomLoader();
//           case Status.error:
//             return GeneralErrorScreen(
//               onTap: () {
//                 homeController.getOfferDetails(id);
//               },
//             );
//           case Status.completed:
//             return Padding(
//               padding: const EdgeInsets.only(top: 24, left: 20, right: 20),
//               child: Column(
//                 children: [
//                   ///==================== Image =====================
//                   Align(
//                     alignment: Alignment.center,
//                     child: CustomNetworkImage(
//                         imageUrl:
//                             "${ApiConstant.baseUrl}${homeController.offerDetailsModel.value.data?.offerImage ?? ""}",
//                         height: 160.h,
//                         width: 110.w),
//                   ),
//
//                   ///==================== Description =====================
//                   SingleChildScrollView(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: List.generate(
//                         homeController
//                             .offerDetailsModel.value.data!.offerDetails!.length,
//                         (index) {
//                           return CustomText(
//                               top: 20.h,
//                               textAlign: TextAlign.justify,
//                               maxLines: 50,
//                               text: homeController.offerDetailsModel.value.data!
//                                   .offerDetails![index]
//                                   .toString());
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//         }
//       }),
//     );
//   }
// }




import 'package:dentist/helper/GenerelError/general_error.dart';
import 'package:dentist/helper/network_img/network_img.dart';
import 'package:dentist/service/api_url.dart';
import 'package:dentist/utils/AppConst/app_const.dart';
import 'package:dentist/utils/StaticString/static_string.dart';
import 'package:dentist/view/screens/home/Mdel/offer_model.dart';
import 'package:dentist/view/screens/home/controller/homecontroller.dart';
import 'package:dentist/view/widgets/custom_image/custom_image.dart';
import 'package:dentist/view/widgets/custom_loader/custom_loader.dart';
import 'package:dentist/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OfferDetails extends StatefulWidget {
  OfferDetails({super.key});

  @override
  State<OfferDetails> createState() => _OfferDetailsState();
}

class _OfferDetailsState extends State<OfferDetails> {
  HomeController homeController = Get.find<HomeController>();

  final String id = Get.arguments;

  @override
  void initState() {
    homeController.getOfferDetails(id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: AppStaticStrings.currentOffersDetails,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Obx(() {
        switch (homeController.rxRequestStatus.value) {
          case Status.loading:
            return const CustomLoader();
          case Status.internetError:
            return const CustomLoader();
          case Status.error:
            return GeneralErrorScreen(
              onTap: () {
                homeController.getOfferDetails(id);
              },
            );
          case Status.completed:
            var offerDetails = homeController.offerDetailsModel.value.data;
            var offerImage = offerDetails?.offerImage ?? "";
            var offerDetailsList = offerDetails?.offerDetails;

            return Padding(
              padding: const EdgeInsets.only(top: 24, left: 20, right: 20),
              child: Column(
                children: [
                  ///==================== Image =====================
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 250.h,
                      width: 250.w,
                      decoration: BoxDecoration(
                      image:  DecorationImage(
                      fit: BoxFit.fill,
                      image:
                      NetworkImage(
                      "${ApiConstant.baseUrl}$offerImage",
                      ),
                      ),
                      ),
                      // child: CustomNetworkImage(
                      //   imageUrl: "${ApiConstant.baseUrl}$offerImage",
                      //   height: 160.h,
                      //   width: 110.w,
                      // ),
                    ),
                  ),

                  ///==================== Description =====================
                  if (offerDetailsList != null)
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          offerDetailsList.length,
                              (index) {
                            return CustomText(
                              top: 20.h,
                              textAlign: TextAlign.justify,
                              maxLines: 50,
                              text: offerDetailsList[index].toString(),
                            );
                          },
                        ),
                      ),
                    ),
                ],
              ),
            );
        }
      }),
    );
  }
}
