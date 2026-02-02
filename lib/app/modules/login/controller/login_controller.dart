import 'package:fieldify/app/core/base/base_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/app_functions/app_validators.dart';
import '../../../core/models/validation_mode.dart';
import '../../../core/utils/app_colors.dart';
import '../../../routes/app_pages.dart';

class LoginController extends BaseController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rememberMe = false.obs;
  final emailMessage =
      ValidationModel(message: '', value: false, color: AppColors.primaryBlue)
          .obs;
  final passwordMessage =
      ValidationModel(message: '', value: false, color: AppColors.primaryBlue)
          .obs;

  void login() {
    Get.offAllNamed(Routes.DASHBOARD);
  }

  void validateEmail() {
    emailMessage.value = Validators.validateEmail(emailController.value.text);
  }

  void validatePassword() {
    passwordMessage.value =
        Validators.validatePassword(passwordController.value.text);
  }

  void setRememberMe(bool value) {
    rememberMe.value = value;
  }

  void navigateToForgetPassword() {
    Get.toNamed(Routes.RESET_PASSWORD);
  }

  void navigateToRegister() {
    Get.toNamed(Routes.REGISTER);
  }

  void signInWithGoogle() {
    Get.offAllNamed(Routes.DASHBOARD);
  }

  void signInWithFacebook() {
    Get.offAllNamed(Routes.DASHBOARD);
  }

  void signInWithApple() {
    Get.offAllNamed(Routes.DASHBOARD);
  }
}
