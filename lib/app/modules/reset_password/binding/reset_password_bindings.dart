import 'package:fieldify/app/modules/reset_password/controller/reset_password_controller.dart';
import 'package:get/get.dart';

class ResetPasswordBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPasswordController>(
      () => ResetPasswordController(),
      fenix: true,
    );
  }
}
