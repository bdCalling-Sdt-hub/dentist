import 'package:dentist/view/screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

class AppRoute {
  static const String splashScreen = "/splash_screen";

  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
  ];
}
