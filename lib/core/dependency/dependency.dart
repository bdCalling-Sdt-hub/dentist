import 'package:dentist/view/screens/authentication/Controller/auth_controller.dart';
import 'package:dentist/view/screens/home/controller/homecontroller.dart';
import 'package:dentist/view/screens/message/controller/message_controller.dart';
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


  }
}
