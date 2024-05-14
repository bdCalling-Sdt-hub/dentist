import 'package:dentist/utils/AppIcons/app_icons.dart';
import 'package:dentist/view/widgets/custom_button/custom_button.dart';
import 'package:dentist/view/widgets/custom_image/custom_image.dart';
import 'package:dentist/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key, required this.onTap});

  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomImage(imageSrc: AppIcons.wifi),
              const CustomText(
                  top: 40,
                  bottom: 40,
                  maxLines: 3,
                  text:
                      "No internet connections found. Check your connections, Please try again"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomButton(
                    title: "Try Again",
                    onTap: () {
                      onTap();
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
