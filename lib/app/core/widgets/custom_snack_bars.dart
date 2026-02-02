import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import '../utils/app_values.dart';

class SnackBars {
  static SnackBar customSnackBar({
    required String message,
    Duration time = const Duration(seconds: 3),
  }) {
    return SnackBar(
      duration: time,
      backgroundColor: AppColors.error,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppValues.radius6),
      ),
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.symmetric(
        vertical: AppValues.height10,
        horizontal: AppValues.width15,
      ),
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.down,
      content:
          Center(child: Text(message, style: AppTextStyles.robotoFourteen)),
    );
  }


}
