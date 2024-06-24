import 'package:dentist/helper/GenerelError/general_error.dart';
import 'package:dentist/utils/AppColors/app_colors.dart';
import 'package:dentist/utils/AppConst/app_const.dart';
import 'package:dentist/utils/AppIcons/app_icons.dart';
import 'package:dentist/utils/StaticString/static_string.dart';
import 'package:dentist/view/screens/notification/Controller/notification_controller.dart';
import 'package:dentist/view/widgets/custom_loader/custom_loader.dart';
import 'package:dentist/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  NotificationController controller=Get.find<NotificationController>();


  // final List<Map<String, String>> notifications = [
  //   {
  //     "title": "New Post  Published",
  //     "sub": "Toothache how and why?",
  //     "time": "20-Dec-2024, 3:00 PM"
  //   },
  //   {
  //     "title": "xmas greetings message",
  //     "sub": "Dr.Adit is available for your consultation.",
  //     "time": "30-Dec-2024, 6:00 PM"
  //   },
  //   {
  //     "title": "New Post  Published",
  //     "sub": "Toothache how and why?",
  //     "time": "18-Dec-2027, 9:00 PM"
  //   },
  //   {
  //     "title":
  //         "New Post  Published Dr.Adit is available for your consultation.",
  //     "sub": "Dr.Adit is available for your consultation.",
  //     "time": "01-Dec-2024, 3:00 PM"
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: AppStaticStrings.notifications,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: PopScope(
        canPop: true,
        onPopInvoked:(didPop) {
          controller.readNotification();
          controller.update();
        },
        child: Obx(() {
          switch (controller.rxRequestStatus.value){
            case Status.loading:
              return const CustomLoader();
            case Status.internetError:
              return const CustomLoader();
            case Status.error:
              return GeneralErrorScreen(
                onTap: () {
                  controller.getNotification();
                },
              );
            case Status.completed:
              return  ListView.builder(
                padding:  const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                controller: controller.scrollController,
                itemCount:controller.notificationModel.length??0,
                itemBuilder: (context, index) {
                 // var data = controller.notificationModel.value.data?[index];
                  return Container(
                    margin:  const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                        image:  const DecorationImage(
                            scale: 10,
                            alignment: Alignment.centerRight,
                            image: AssetImage(AppIcons.logo),
                            opacity: .05),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.1, 1.0), //(x,y)
                            blurRadius: 1,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(14),
                        color: controller.notificationModel![index].read==true?AppColors.loght400:AppColors.loght600),
                    padding: EdgeInsets.all(20.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///======================== Title ========================
        
                        CustomText(
                          textAlign: TextAlign.left,
                          maxLines: 3,
                          text:controller.notificationModel?[index].type??"",
                          color: AppColors.green800,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
        
                        ///======================= Sub Title ======================
        
                        CustomText(
                          textAlign: TextAlign.left,
                          maxLines: 3,
                          top: 6,
                          bottom: 6,
                          text:controller.notificationModel?[index].message??"",
                          fontWeight: FontWeight.w500,
                        ),
        
                        ///======================= Time ======================
        
                        CustomText(
                          text:DateFormat('MMM d hh:mm aaa').format(controller.notificationModel![index].createdAt!.toLocal()),
                          fontWeight: FontWeight.w300,
                        ),
                      ],
                    ),
                  );
                },
              );
          }
        }),
      ),
    );
  }
}
