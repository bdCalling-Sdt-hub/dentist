import 'dart:async';
import 'package:dentist/core/app_routes/app_routes.dart';
import 'package:dentist/utils/AppColors/app_colors.dart';
import 'package:dentist/view/screens/authentication/Controller/auth_controller.dart';
import 'package:dentist/view/widgets/custom_button/custom_button.dart';
import 'package:dentist/view/widgets/custom_loader/custom_loader.dart';
import 'package:dentist/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController pinController = TextEditingController();

  int _secondsRemaining = 20;

  late Timer _timer;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel();
        }
      });
    });
  }
  @override
  void initState() {
    startTimer();
    super.initState();
  }
  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(),
      body: GetBuilder<AuthController>(
        builder: (controller) {
          return Center(
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: 24.h,horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ///==============================Enter 6 digit code ===========================
                    CustomText(
                      text:"Enter 4 digits code",
                      fontSize: 24.w,
                      fontWeight: FontWeight.w500,
                      color: AppColors.green500,
                      bottom: 12.h,
                    ),

                    ///==============================email verification Text===========================
                    CustomText(
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      text:"Enter the 6 digits code that you received on your email",
                      fontSize: 14.w,
                    ),

                    SizedBox(
                      height: 40.h,
                    ),

                    ///<====================== otp field =======================>
                    PinCodeTextField(
                     // controller: pinController,
                      length: 4,
                      cursorColor: AppColors.green500,
                      keyboardType: TextInputType.text,
                      enablePinAutofill: true,
                      appContext: (context),
                      onCompleted: (value) {
                        controller.otp = value.toString();
                        controller.update();

                        print("=-=-==-=-=--==-=-=-=-=-=-=-=-This is an otp ${controller.otp}");

                      },
                      autoFocus: true,
                      textStyle:
                      const TextStyle(color: AppColors.green500, fontSize: 24),
                      pinTheme: PinTheme(
                        disabledColor: Colors.transparent,
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(8),
                        fieldHeight: 54.h,
                        fieldWidth: 44,
                        activeFillColor: AppColors.loght500,
                        selectedFillColor: AppColors.loght500,
                        inactiveFillColor: AppColors.loght500,
                        borderWidth: 0.5,
                        errorBorderColor: Colors.red,
                        activeBorderWidth: 0,
                        selectedColor: AppColors.loght500,
                        inactiveColor: const Color(0xFFCCCCCC),
                        activeColor: AppColors.loght500,
                      ),
                      enableActiveFill: true,
                    ),

                    SizedBox(
                      height: 24.h,
                    ),

                    /// <================= send again =======================>
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: "I didn't find confirmation code",
                          fontSize: 14.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (_secondsRemaining == 0) {
                              _secondsRemaining = 120;
                              startTimer();
                              controller.handleForgetPassword().then((value) {
                                if (value == false) {
                                  setState(() {
                                    _timer.cancel();
                                    _secondsRemaining = 0;
                                  });
                                }
                              });
                            }
                          },
                          child: CustomText(
                              text: _secondsRemaining == 0
                                  ? "Resend OTP".tr
                                  : "Resend SMS $_secondsRemaining",
                              color: AppColors.redColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 40.h,
                    ),

                    ///<=====================  button ========================>

                  controller.signInLoading==true?const CustomLoader():CustomButton(
                      onTap: () async{
                      controller.forgotOTp();
                      },
                      title:"Verify code",
                    ),
                  ],
                ),
              ),
            );
        }
      ),
    );
  }
}
