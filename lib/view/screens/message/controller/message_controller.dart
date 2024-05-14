import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  RxBool isChat = true.obs;
  RxDouble dragabbleHorizontal = 20.0.obs;
  RxDouble dragabbleVerticel = 100.0.obs;
  ScrollController scrollController = ScrollController();

  List<Map<String, dynamic>> inboxChat = [
    {"sender": "0", "message": "Hii, hello", "messageType": "text"},
    {
      "sender": "0",
      "message":
          "We will meet soon  sorry  babe. i promise upcoming sun we will meet for sure. See you again. bye bye",
      "messageType": "text"
    },
    {"sender": "1", "message": "okk", "messageType": "text"},
    {"sender": "0", "message": "Iam Fine, hello", "messageType": "text"},
    {"sender": "1", "message": "hii", "messageType": "text"},
    {"sender": "1", "message": "Bye", "messageType": "text"},
  ];

  // final List<Map<String, dynamic>> chatList = [
  //   {
  //     "img": AppConstants.onlineImage,
  //     "title": "Maria *Artist",
  //     "subTitle": "Hello...how are you",
  //     "follower": "5.2K Favorite",
  //     "timeOrPrice": "2 min ago",
  //     "color": AppColors.violetLightHover
  //   },
  //   {
  //     "img":  AppConstants.onlineImage,
  //     "title": "Rocky *user",
  //     "subTitle": "Hello...how are you",
  //     "follower": "6.2K Favorite",
  //     "timeOrPrice": "2 min ago",
  //     "color": AppColors.pinkLightHover
  //   },
  //   {
  //     "img":  AppConstants.onlineImage,
  //     "title": "Rocky *user",
  //     "subTitle": "Hello...how are you",
  //     "follower": "6.2K Favorite",
  //     "timeOrPrice": "2 min ago",
  //     "color": AppColors.lightPurpleLightHover
  //   },
  // ];

  RxList selectedMembers = [].obs;
}
