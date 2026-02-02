import 'package:fieldify/app/core/base/base_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../core/app_functions/app_validators.dart';
import '../../../core/models/validation_mode.dart';
import '../../../core/utils/app_colors.dart';

class ResetPasswordController extends BaseController {
  final emailController = TextEditingController();

  final emailMessage =
      ValidationModel(message: '', value: false, color: AppColors.primaryBlue)
          .obs;

  login() {
    logger.i('login clicked');
  }

  void validateEmail() {
    emailMessage.value = Validators.validateEmail(emailController.value.text);
  }
}
