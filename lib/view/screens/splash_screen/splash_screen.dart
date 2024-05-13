import 'package:dentist/core/app_routes/app_routes.dart';
import 'package:dentist/utils/AppIcons/app_icons.dart';
import 'package:dentist/view/widgets/custom_image/custom_image.dart';
import 'package:dentist/view/widgets/custom_loader/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  navigate() {
    Future.delayed(const Duration(seconds: 1), () {
      Get.offAllNamed(AppRoute.onBoarding);
    });
  }

  @override
  void initState() {
    navigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomImage(
            size: 180,
            imageType: ImageType.png,
            imageSrc: AppIcons.logo,
          ),
          SizedBox(
            height: 140,
          ),
          CustomLoader()
        ],
      ),
    );
  }
}
