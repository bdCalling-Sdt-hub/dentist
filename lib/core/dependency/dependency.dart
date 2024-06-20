import 'package:dentist/global/controller/generelController.dart';
import 'package:dentist/view/screens/about_us/Controller/about_us_controller.dart';
import 'package:dentist/view/screens/authentication/Controller/auth_controller.dart';
import 'package:dentist/view/screens/conditionDetails/Controller/article_details_controller.dart';
import 'package:dentist/view/screens/dentalCondition/Controller/article_controller.dart';
import 'package:dentist/view/screens/home/controller/homecontroller.dart';
import 'package:dentist/view/screens/message/controller/message_controller.dart';
import 'package:dentist/view/screens/notification/Controller/notification_controller.dart';
import 'package:dentist/view/screens/privacy_policy/Controller/privacy_controller.dart';
import 'package:dentist/view/screens/profile/Controller/profile_controller.dart';
import 'package:dentist/view/screens/terms_condition/Controller/terms_condition_controller.dart';
import 'package:get/get.dart';

class DependancyInjection extends Bindings {
  @override
  void dependencies() {

    ///================ Home Controller =================
    Get.lazyPut(() => HomeController(), fenix: true);

    ///================ Auth Controller =================

    Get.lazyPut(() => AuthController(), fenix: true);

    ///================ Message Controller =================

    Get.lazyPut(() => MessageController(), fenix: true);

    ///================ Terms Condition Controller =================

    Get.lazyPut(() => TermsConditionController(), fenix: true);

    ///================ About Us Controller =================

    Get.lazyPut(() => AboutUsController(), fenix: true);

    ///================ Privacy Policy  Controller =================

    Get.lazyPut(() => PrivacyController(), fenix: true);

    ///================ Profile  Controller =================

    Get.lazyPut(() => ProfileController(), fenix: true);

    ///================ Article   Controller =================

    Get.lazyPut(() => ArticleController(), fenix: true);

    Get.lazyPut(() => ArticleDetailsController(), fenix: true);

    Get.lazyPut(()=> MessageController(), fenix: true);

    Get.lazyPut(()=> NotificationController(), fenix: true);

    Get.lazyPut(()=> GeneralController(), fenix: true);

    Get.put(GeneralController());



  }
}
