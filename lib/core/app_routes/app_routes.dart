import 'package:dentist/view/screens/authentication/sign_in.dart';
import 'package:dentist/view/screens/home/home.dart';
import 'package:dentist/view/screens/onboarding/onboarding.dart';
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

  static List<GetPage> routes = [
    ///==================== Initial Routes ====================

    GetPage(name: splashScreen, page: () => const SplashScreen()),

    GetPage(name: onBoarding, page: () => const OnBoardingPage()),

    ///========================= Auth =========================

    GetPage(name: signIn, page: () => SignInScreen()),

    ///==================== Home Screen ====================
    GetPage(name: home, page: () => HomeScreen()),
  ];
}
