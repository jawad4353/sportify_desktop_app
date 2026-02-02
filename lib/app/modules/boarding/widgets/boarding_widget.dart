import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_styles.dart';
import '../../../core/utils/app_values.dart';

class BoardingMainWidget extends StatelessWidget {
  final String iconPath;
  final String topTitle;
  final String subtitle;

  const BoardingMainWidget({
    required this.iconPath,
    required this.topTitle,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Get.theme.brightness == Brightness.dark;
    final imageHeight = (MediaQuery.sizeOf(context).height * 0.35).clamp(200.0, 320.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 32),
        Text(
          '"$topTitle"',
          textAlign: TextAlign.center,
          style: AppTextStyles.robotoTwenty.copyWith(
            fontWeight: FontWeight.bold,
            color: isDarkMode ? AppColors.white : AppColors.primaryBlue,
          ),
        ),
        SizedBox(height: AppValues.height20),
        SvgPicture.asset(
          iconPath,
          height: imageHeight,
        ),
        SizedBox(height: AppValues.height20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppValues.padding16, vertical: AppValues.height1),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.robotoSixteen.copyWith(
              color: isDarkMode ? AppColors.white : AppColors.greyText,
            ),
          ),
        ),
      ],
    );
  }
}
