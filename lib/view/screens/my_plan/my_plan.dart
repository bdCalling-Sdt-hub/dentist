import 'package:dentist/utils/StaticString/static_string.dart';
import 'package:dentist/view/widgets/custom_text/custom_text.dart';
import 'package:dentist/view/widgets/navBar/nav_bar.dart';
import 'package:flutter/material.dart';

class MyPlan extends StatelessWidget {
  const MyPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:const NavBar(currentIndex: 1),
      appBar: AppBar(
        title: const CustomText(
          text: AppStaticStrings.myPlan,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
