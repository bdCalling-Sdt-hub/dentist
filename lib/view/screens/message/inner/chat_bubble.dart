import 'package:cached_network_image/cached_network_image.dart';
import 'package:dentist/helper/GenerelError/general_error.dart';
import 'package:dentist/service/api_url.dart';
import 'package:dentist/utils/AppColors/app_colors.dart';
import 'package:dentist/utils/AppConst/app_const.dart';
import 'package:dentist/utils/AppIcons/app_icons.dart';
import 'package:dentist/view/screens/message/controller/message_controller.dart';
import 'package:dentist/view/screens/no_internet/no_internet.dart';
import 'package:dentist/view/widgets/custom_loader/custom_loader.dart';
import 'package:dentist/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatBubbleMessage extends StatefulWidget {
  const ChatBubbleMessage({
    super.key,
  });

  @override
  State<ChatBubbleMessage> createState() => _ChatBubbleMessageState();
}

class _ChatBubbleMessageState extends State<ChatBubbleMessage> {
  @override
  void dispose() {
    // voiceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppIcons.logo),
              opacity: .05,
              fit: BoxFit.contain)),
      padding: const EdgeInsets.all(8.0),
      child: GetBuilder<MessageController>(builder:(controller){
        return ListView.builder(
            reverse: true,
            controller: controller.scrollController,
            itemCount: controller.messageList.length,
            itemBuilder: (context,index) {
              return Column(
                //=======================Align the text based on user=================
                crossAxisAlignment:
                controller.messageList[index].sender=="patient"
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Row(
                      mainAxisAlignment:

                      controller.messageList[index].sender=="patient"
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 8,
                        ),

                        ///=============================Type Image=========================

                        if (controller
                                .messageList[index].messageType =="image")
                          Container(
                              height: 260.h,
                              width: 260.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: NetworkImage(
                                       "${ApiConstant.baseUrl}${ controller.messageList[index].image.toString()}",
                                      )
                                  ))),

                        ///=============================Type Message=========================

                        if (
                        controller.messageList[index].messageType=="text"
                        )
                          Flexible(
                            child: Row(
                              mainAxisAlignment:
                              controller.messageList[index].sender=="patient"
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.start,
                              //crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                ///=======================Show time if Getting Message=================

                                if(controller.messageList[index].sender=="patient")
                                  CustomText(
                                    right: 10.w,
                                    text:DateFormat('jm').format( controller.messageList[index].createdAt!.toLocal(),),
                                    fontSize: 10.w,
                                    fontWeight: FontWeight.w200,
                                  ),

                                ///============================Message Body==============================

                                Flexible(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 10),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.dark100),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8.r),
                                          topRight: Radius.circular(8.r),
                                          bottomLeft:

                                          controller.messageList[index].sender=="patient"
                                              ? Radius.circular(8.r)
                                              : Radius.circular(0.r),
                                          bottomRight:

                                          controller.messageList[index].sender=="patient"
                                              ? Radius.circular(8.r)
                                              : Radius.circular(0.r),
                                        ),
                                        color:

                                        controller.messageList[index].sender=="patient"
                                            ? AppColors.loght100
                                            : AppColors.dark900),
                                    child: CustomText(
                                      maxLines: 10,
                                      textAlign: TextAlign.left,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      text: //controller.inboxChat[index]
                                      controller.messageList[index].text??"",
                                      color:
                                      controller.messageList[index].sender=="patient"
                                          ? AppColors.green400
                                          : AppColors.loght100,
                                    ),
                                  ),
                                ),

                                ///=======================Show time if Sending Message=================

                                if (controller.messageList[index].sender!="patient")
                                  CustomText(
                                    left: 10.w,
                                    text: DateFormat('jm').format(controller.messageList[index].createdAt!.toLocal(),),
                                    fontSize: 10.w,
                                    fontWeight: FontWeight.w200,
                                  ),
                              ],
                            ),
                          ),

                          if(controller.messageList[index].messageType=="both")
                            Column(
                              children: [

                                Container(
                                    height: 200.h,
                                    width: 200.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            fit: BoxFit.contain,
                                            image: NetworkImage(
                                              "${ApiConstant.baseUrl}${ controller.messageList[index].image.toString()}",
                                            )
                                        ))),

                                CustomText(
                                  maxLines: 10,
                                  textAlign: TextAlign.left,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  text: //controller.inboxChat[index]
                                  controller.messageList[index].text??"",
                                  color:
                                  controller.messageList[index].sender=="patient"
                                      ? AppColors.green400
                                      : AppColors.loght100,
                                ),
                              ],
                            ),


                        const SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            });
      }),
    );
  }
}

