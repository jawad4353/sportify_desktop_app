import 'package:fieldify/app/modules/login/controller/login_controller.dart';
import 'package:get/get.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
      fenix: true,
    );
  }
}
