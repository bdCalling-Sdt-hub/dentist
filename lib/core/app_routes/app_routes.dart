import 'package:dentist/view/screens/ForgotPasswordScreen/forgot_password.dart';
import 'package:dentist/view/screens/ForgotPasswordScreen/otp_screen.dart';
import 'package:dentist/view/screens/ResetPasswordScreen/reset.dart';
import 'package:dentist/view/screens/SendEmialScreen/email_send.dart';
import 'package:dentist/view/screens/about_us/about_us.dart';
import 'package:dentist/view/screens/authentication/sign_in.dart';
import 'package:dentist/view/screens/change_pass/change_pass.dart';
import 'package:dentist/view/screens/conditionDetails/condition_details.dart';
import 'package:dentist/view/screens/current_offer/current_offer.dart';
import 'package:dentist/view/screens/dentalCondition/dental_condition.dart';
import 'package:dentist/view/screens/edit_profile/edit_profile.dart';
import 'package:dentist/view/screens/faq_screen/faq_screen.dart';
import 'package:dentist/view/screens/home/home.dart';
import 'package:dentist/view/screens/no_internet/no_internet.dart';
import 'package:dentist/view/screens/notification/notification.dart';
import 'package:dentist/view/screens/offer_details/offer_details.dart';
import 'package:dentist/view/screens/onboarding/onboarding.dart';
import 'package:dentist/view/screens/privacy_policy/privacy_policy.dart';
import 'package:dentist/view/screens/profile/profile.dart';
import 'package:dentist/view/screens/search_screen/search_screen.dart';
import 'package:dentist/view/screens/settings/settings.dart';
import 'package:dentist/view/screens/skinCondition/skin_condition.dart';
import 'package:dentist/view/screens/splash_screen/splash_screen.dart';
import 'package:dentist/view/screens/terms_condition/terms_condition.dart';
import 'package:get/get.dart';

class AppRoute {
  ///==================== Initial Routes ====================
  static const String splashScreen = "/splash_screen";
  static const String onBoarding = "/onBoarding";

  ///==================== Auth ====================

  static const String signIn = "/signIn";

  ///==================== Home Screen ====================

  static const String home = "/home";

  ///==================== Dental Condition ====================

  static const String dentalCondition = "/dentalCondition";

  ///==================== Skin Condition ====================

  static const String skinCondition = "/skinCondition";

  ///==================== Condition Details ====================

  static const String conditionDetails = "/conditionDetails";

  ///==================== FAQ Screen ====================

  static const String faq = "/faq";

  ///==================== Search Screen ====================

  static const String search = "/search";

  ///==================== Current Offer Screen ====================

  static const String currentOffer = "/currentOffer";

  ///==================== Current Offer Details ====================

  static const String offerDetails = "/offerDetails";

  ///==================== Profile ====================

  static const String editProfile = "/editProfile";

  static const String profile = "/profile";

  ///==================== No Internet ====================

  static const String noInternet = "/noInternet";

  ///==================== Notification ====================

  static const String notification = "/Notification";

  ///============================ Side Drawer ==========================

  static const String aboutUs = "/aboutUs";
  static const String privacyPolicy = "/privacyPolicy";
  static const String termsCondition = "/termsCondition";
  static const String settings = "/settings";

  ///============================ Change Pass ==========================
  static const String changePass = "/changePass";

  ///============================ Forgot Password ==========================
  static const String forgotPassScreen = "/forgotPassScreen";

  static const String otpScreen = "/otpScreen";

  static const String resetPasswordScreen = "/resetPasswordScreen";

  static const String emailSendScreen = "/emailSendScreen";



  static List<GetPage> routes = [
    ///==================== Initial Routes ====================

    GetPage(name: splashScreen, page: () => const SplashScreen()),

    GetPage(name: onBoarding, page: () => const OnBoardingPage()),

    ///========================= Auth =========================

    GetPage(name: signIn, page: () => SignInScreen()),

    ///==================== Home Screen ====================
    GetPage(name: home, page: () => HomeScreen()),

    ///==================== Dental Condition ====================
    GetPage(name: dentalCondition, page: () => DentalCondition()),

    ///==================== Skin Condition ====================

    GetPage(name: skinCondition, page: () => SkinCondition()),

    ///==================== Condition Details ====================
    GetPage(name: conditionDetails, page: () => ConditionDetails()),

    ///==================== FAQ Screen ====================

    GetPage(name: faq, page: () => FAQScreen()),

    ///==================== Search Screen ====================
    GetPage(name: search, page: () => const SearchScreen()),

    ///==================== Current Offer Screen ====================

    GetPage(name: currentOffer, page: () => CurrentOffer()),

    ///==================== Current Offer Details ====================
    GetPage(name: offerDetails, page: () => OfferDetails()),

    ///==================== Profile ====================

    GetPage(name: editProfile, page: () =>  EditProfile()),
    GetPage(name: profile, page: () =>  ProfileScreen()),

    ///==================== No Internet ====================
    GetPage(
        name: noInternet,
        page: () => NoInternetScreen(
              onTap: () {},
            )),

    ///==================== Notification ====================

    GetPage(name: notification, page: () => NotificationScreen()),

    ///============================ Side Drawer ==========================

    GetPage(name: aboutUs, page: () => AboutUs()),
    GetPage(name: privacyPolicy, page: () =>  PrivacyPolicy()),
    GetPage(name: termsCondition, page: () =>  TermsCondition()),
    GetPage(name: settings, page: () => const SettingScreen()),

    ///============================ Change Pass ==========================
    GetPage(name: changePass, page: () =>  ChangePass()),

    ///============================ Forgot Pass ==========================
    GetPage(name: forgotPassScreen, page: () =>  ForgotPasswordScreen()),

    GetPage(name: otpScreen, page: () =>  OtpScreen()),

    GetPage(name: resetPasswordScreen, page: () =>  ResetPasswordScreen()),

    GetPage(name: emailSendScreen, page: () =>  EmailSendScreen()),

  ];
}
