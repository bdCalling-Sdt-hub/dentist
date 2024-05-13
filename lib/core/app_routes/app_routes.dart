import 'package:dentist/view/screens/authentication/sign_in.dart';
import 'package:dentist/view/screens/conditionDetails/condition_details.dart';
import 'package:dentist/view/screens/dentalCondition/dental_condition.dart';
import 'package:dentist/view/screens/faq_screen/faq_screen.dart';
import 'package:dentist/view/screens/home/home.dart';
import 'package:dentist/view/screens/onboarding/onboarding.dart';
import 'package:dentist/view/screens/skinCondition/skin_condition.dart';
import 'package:dentist/view/screens/splash_screen/splash_screen.dart';
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
  ];
}
