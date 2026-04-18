import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:pulse_cart/controller/auth/signup_controller.dart';
import 'package:pulse_cart/core/class/crud.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpControllerImp(),fenix: true);
    Get.put(Crud());
  }
}
