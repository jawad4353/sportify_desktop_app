import 'package:fieldify/app/modules/settings/controller/settings_controller.dart';
import 'package:get/get.dart';

class SettingsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(
      () => SettingsController(),
      fenix: true,
    );
  }
}
