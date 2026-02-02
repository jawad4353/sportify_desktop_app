import 'package:get/get.dart';

import '../../../l10n/app_translations.dart';
import '../models/validation_mode.dart';
import '../utils/app_colors.dart';

class Validators {
  static ValidationModel validateEmail(String value) {
    RegExp regExp = RegExp(r'^[a-zA-Z0-9._%+-]+@mail\.bcu\.ac\.uk$');
    bool isValid = regExp.hasMatch(value);

    return ValidationModel.fromMap({
      'message':
          isValid ? AppTranslations.empty.tr : AppTranslations.invalidEmail.tr,
      'value': isValid,
      'color': isValid ? AppColors.green : AppColors.red
    });
  }

  static ValidationModel validatePassword(String value) {
    if (value.trim().isEmpty || value.trim().length < 1) {
      return ValidationModel.fromMap({
        'message': AppTranslations.invalidPassword.tr,
        'value': false,
        'color': AppColors.red
      });
    }

    return ValidationModel.fromMap({
      'message': AppTranslations.empty.tr,
      'value': true,
      'color': AppColors.green
    });
  }

  static ValidationModel validateName(String value) {
    if (value.trim().isEmpty || value.trim().length < 1) {
      return ValidationModel.fromMap({
        'message': AppTranslations.invalidName.tr,
        'value': true,
        'color': AppColors.red
      });
    }

    return ValidationModel.fromMap({
      'message': AppTranslations.empty,
      'value': true,
      'color': AppColors.green
    });
  }
}
