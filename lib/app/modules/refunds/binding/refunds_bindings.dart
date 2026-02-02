import 'package:fieldify/app/modules/refunds/controller/refunds_controller.dart';
import 'package:get/get.dart';

class RefundsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RefundsController>(
      () => RefundsController(),
      fenix: true,
    );
  }
}
