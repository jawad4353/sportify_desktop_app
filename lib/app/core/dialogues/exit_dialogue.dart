import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import '../utils/app_values.dart';
import '../widgets/custom_buttons.dart';

Future<bool> dialogueExitLogout({
  required String title,
  required String yesButtonText,
  required String cancelButtonText,
  required BuildContext context,
}) async {
  return (await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppValues.radius5),
          ),
          title: Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppValues.padding10,
            ),
            child: Text(
              title,
              style: AppTextStyles.robotoSixteen,
              textAlign: TextAlign.center,
            ),
          ),
          actions: [
            SizedBox(
              height: AppValues.height40,
              width: AppValues.width30,
              child: ButtonFactory.primary(
                onPressed: () => Navigator.of(context).pop(true),
                title: yesButtonText,
                bgColor: AppColors.primaryBlue,
                fgColor: AppColors.white,
              ),
            ),
            SizedBox(
              height: AppValues.height40,
              width: AppValues.width30,
              child: ButtonFactory.primary(
                onPressed: () => Navigator.of(context).pop(false),
                title: cancelButtonText,
                bgColor: AppColors.white,
                fgColor: AppColors.primaryBlue,
              ),
            ),
          ],
        ),
      )) ??
      false;
}
