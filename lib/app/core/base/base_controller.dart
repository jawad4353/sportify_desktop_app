import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';

abstract class BaseController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  void showLoading() {
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(
          color: AppColors.primaryBlue,
        ),
      ),
      barrierDismissible: false,
    );
  }

  void hideLoading() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }
}
