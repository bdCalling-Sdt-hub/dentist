
import 'dart:io';

import 'package:dentist/helper/GenerelError/general_error.dart';
import 'package:dentist/utils/AppColors/app_colors.dart';
import 'package:dentist/utils/AppConst/app_const.dart';
import 'package:dentist/utils/StaticString/static_string.dart';
import 'package:dentist/view/screens/message/controller/message_controller.dart';
import 'package:dentist/view/screens/message/inner/chat_bubble.dart';
import 'package:dentist/view/screens/message/inner/input_field.dart';
import 'package:dentist/view/screens/no_internet/no_internet.dart';
import 'package:dentist/view/widgets/custom_loader/custom_loader.dart';
import 'package:dentist/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageScreen extends StatefulWidget {
  MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}
class _MessageScreenState extends State<MessageScreen> {

  // bool ios=false;
  // getPlatform(){
  //   if (Platform.isIOS) {
  //     print('Running on iOS');
  //     setState(() {
  //       ios=true;
  //       print(ios);
  //     });
  //   }
  // }
  //
  // @override
  // void initState() {
  //   getPlatform();
  //   super.initState();
  // }


  final MessageController inboxController = Get.find<MessageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         iconTheme: const IconThemeData(color: AppColors.loght50),
        bottomOpacity: 10,
       backgroundColor: AppColors.green900,
       centerTitle: true,
       title:const CustomText(text:AppStaticStrings.dentalApp,fontSize: 20,color:AppColors.loght50,),
       elevation:20,
      ),

      bottomNavigationBar:  MessageInputField(onTap: () {
       inboxController.sendMessage();
      },),
      body:
      Obx(() {
        switch (inboxController.rxRequestStatus.value) {
          case Status.loading:
            return const CustomLoader();
          case Status.internetError:
            return NoInternetScreen(
              onTap: () {
                inboxController.getMyChat();
              },
            );
          case Status.error:
            return GeneralErrorScreen(
              onTap: () {
               inboxController.getMyChat();
              },
            );
          case Status.completed:
            return  const Column(children: [
        ///============================== App Bar ==============================
       //  MessageAppBar(
       // // img: AppConstants.onlineImage,
       //  userName: AppStaticStrings.dentalApp,
       //  ),

        ///============================== Chat Bubble ==============================

        Expanded(child:ChatBubbleMessage()),

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
