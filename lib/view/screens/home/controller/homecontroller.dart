import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt bannerIndex = 0.obs;
  Rx<PageController> pageController = PageController().obs;

  RxInt selectedFqw = 100000.obs;
}
