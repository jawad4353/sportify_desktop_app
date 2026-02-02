import 'package:get/get.dart';

import '../controller/boarding_controller.dart';

class BoardingBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BoardingController>(
      () => BoardingController(),
      fenix: true,
    );
  }
}
