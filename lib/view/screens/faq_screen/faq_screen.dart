import 'package:dentist/utils/StaticString/static_string.dart';
import 'package:dentist/view/widgets/custom_faq_design/custom_faq_design.dart';
import 'package:dentist/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  FAQScreen({super.key});

  final List<Map<String, String>> faqList = [
    {
      "que": "How dose this app work?",
      "ans": "This is an dummy answer, To show in UI"
    },
    {
      "que": "How can i cancle my order",
      "ans": "This is an dummy answer, To show in UI"
    },
    {
      "que": "Is my data secure?",
      "ans":
          "This is an dummy answer, To show in UI, This is an dummy answer, To show in UI, This is an dummy answer, To show in UI, "
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: AppStaticStrings.fAQ,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: FaqDesign(faqList: faqList),
      ),
    );
  }
}
