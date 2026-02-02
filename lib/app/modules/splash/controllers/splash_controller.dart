import 'package:get/get.dart';

import '/app/core/base/base_controller.dart';
import '../../../routes/app_pages.dart';

class SplashController extends BaseController {
  @override
  void onInit() {
    super.onInit();
    moveToBoarding();
  }

  bool moveToBoarding() {
    Future.delayed(const Duration(seconds: 4), () {
      Get.offNamed(Routes.BOARDING);
    });

    return true;
  }
}
