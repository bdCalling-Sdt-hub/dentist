import 'package:dentist/helper/GenerelError/general_error.dart';
import 'package:dentist/utils/AppConst/app_const.dart';
import 'package:dentist/utils/StaticString/static_string.dart';
import 'package:dentist/view/screens/message/controller/message_controller.dart';
import 'package:dentist/view/screens/message/inner/app_bar.dart';
import 'package:dentist/view/screens/message/inner/chat_bubble.dart';
import 'package:dentist/view/screens/message/inner/input_field.dart';
import 'package:dentist/view/widgets/custom_loader/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageScreen extends StatefulWidget {
  MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}
class _MessageScreenState extends State<MessageScreen> {


  final MessageController inboxController = Get.find<MessageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  MessageInputField(onTap: () {
       inboxController.sendMessage();
      },),
      body:
      Obx(() {
        switch (inboxController.rxRequestStatus.value) {
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
            return  Column(children: [
        ///============================== App Bar ==============================
        MessageAppBar(
        img: AppConstants.onlineImage,
        userName: AppStaticStrings.dentalApp,
        ),

        ///============================== Chat Bubble ==============================

        const Expanded(child:ChatBubbleMessage()),

        // ///========================== BackGround Image ============================

        // const Align(
        //   alignment: Alignment.center,
        //   child: Opacity(
        //     opacity: 0.07,
        //     child: CustomImage(
        //       imageSrc: AppIcons.logo,
        //       imageType: ImageType.png,
        //     ),
        //   ),
        // )
        ]);
        }
      })
    );
  }
}
