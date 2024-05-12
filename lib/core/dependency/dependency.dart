import 'package:dentist/view/screens/home/controller/homecontroller.dart';
import 'package:get/get.dart';

class DependancyInjection extends Bindings {
  @override
  void dependencies() {
    ///================ Home Controller =================
    Get.lazyPut(() => HomeController(), fenix: true);
  }
}
