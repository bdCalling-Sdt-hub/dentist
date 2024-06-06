
import 'package:dentist/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailSendScreen extends StatefulWidget {
  const EmailSendScreen({super.key});

  @override
  State<EmailSendScreen> createState() => _EmailSendScreenState();
}

class _EmailSendScreenState extends State<EmailSendScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 24.h),
        child:  Column(
          children: [
           Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
           const CustomText(
           text:"Sent mail",
           fontSize: 16,
           fontWeight: FontWeight.w600,
           ),

           IconButton(onPressed:(){
             
           },
           icon:const Icon(Icons.clear,size: 24,)),
           ],
           ),
          ],
        ),
      ),
    );
  }
}
