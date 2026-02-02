import 'package:fieldify/app/modules/register/controller/register_controller.dart';
import 'package:get/get.dart';

class RegisterBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
      () => RegisterController(),
      fenix: true,
    );
  }
}
