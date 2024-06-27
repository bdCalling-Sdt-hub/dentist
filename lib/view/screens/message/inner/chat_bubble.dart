import 'package:cached_network_image/cached_network_image.dart';
import 'package:dentist/service/api_url.dart';
import 'package:dentist/utils/AppColors/app_colors.dart';
import 'package:dentist/utils/AppIcons/app_icons.dart';
import 'package:dentist/view/screens/message/controller/message_controller.dart';
import 'package:dentist/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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


  MessageController controller=Get.find<MessageController>();

  @override
  void dispose() {
    controller.scrollController.dispose();
    super.dispose();
  }

  // @override
  // void dispose() {
  //   // voiceController.dispose();
  //   super.dispose();
  // }

  // void _scrollToBottom() {
  //   if (controller.scrollController.hasClients) {
  //     controller.scrollController.animateTo(controller.scrollController.position.maxScrollExtent);
  //     duration: const Duration(milliseconds:500);
  //   curve: Curves.easeInOutSine;
  //
  //   }
  //
  // }
  void _scrollToBottom() {
  controller. scrollController.animateTo(
    controller. scrollController.position.extentTotal,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }



  // @override
  // void initState() {
  //       WidgetsBinding.instance.addPostFrameCallback((_){
  //   _scrollToBottom();
  //       });
  //    //scrollToBottom();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppIcons.logo),
              opacity: .05,
              fit: BoxFit.contain)),
      padding:  const EdgeInsets.all(8.0),
      child: GetBuilder<MessageController>(builder:(controller){
        WidgetsBinding.instance.addPostFrameCallback((_){
          _scrollToBottom();
        });

        return ListView.builder(
         // reverse: true,
            controller: controller.scrollController,
            itemCount: controller.messageList?.length??0,
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
                              height: 200.h,
                              width: 200.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image:

                                    CachedNetworkImageProvider("${ApiConstant.baseUrl}${ controller.messageList[index].image.toString()}",
                                    )

                                      // NetworkImage(
                                      //  "${ApiConstant.baseUrl}${ controller.messageList[index].image.toString()}",
                                      // )
                                  ))),


                        ///=============================Type Message=========================

                        if(
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
                            Container(
                             padding: EdgeInsets.symmetric(vertical: 5.h),
                              width: 200.w,
                              child: Column(
                                children: [
                                  Container(
                                      height: 200.h,
                                      width: 200.w,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image:CachedNetworkImageProvider(
                                                "${ApiConstant.baseUrl}${controller.messageList[index].image.toString()}",
                                              )
                                          ))),
                                      Row(
                                        mainAxisAlignment:
                                        controller.messageList[index].sender=="patient"
                                            ? MainAxisAlignment.end
                                            : MainAxisAlignment.start,
                                        children: [
                                          // if (controller.messageList[index].sender!="patient")
                                          Expanded(
                                            child: CustomText(
                                              maxLines:10,
                                              textAlign:TextAlign.start,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              text: controller.messageList[index].text??"",
                                              color: AppColors.green400
                                                  // : AppColors.loght100,
                                            ),
                                          ),

                                          CustomText(
                                             textAlign: TextAlign.end,
                                             text: DateFormat('jm').format(controller.messageList[index].createdAt!.toLocal(),),
                                             fontSize: 10.w,
                                             fontWeight: FontWeight.w200,
                                           ),
                                        ],
                                      ),

                                ],
                              ),
                            ),
                        const SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.h,),
                ],
              );
            });
      }),
    );
  }
}

