import 'package:dentist/utils/AppConst/app_const.dart';
import 'package:dentist/utils/StaticString/static_string.dart';
import 'package:dentist/view/screens/message/controller/message_controller.dart';
import 'package:dentist/view/screens/message/inner/app_bar.dart';
import 'package:dentist/view/screens/message/inner/chat_bubble.dart';
import 'package:dentist/view/screens/message/inner/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageScreen extends StatelessWidget {
  MessageScreen({super.key});

  // final String image = Get.arguments[0];

  // final String name = Get.arguments[1];

  final MessageController inboxController = Get.find<MessageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MessageInputField(),
      body: Column(children: [
        //============================== App Bar ==============================

        MessageAppBar(
          img: AppConstants.onlineImage,
          userName: AppStaticStrings.dentalApp,
        ),

        //============================== Chat Bubble ==============================

        const Expanded(child: ChatBubbleMessage()),

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
      ]),
    );
  }
}
