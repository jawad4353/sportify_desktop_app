import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_text_styles.dart';
import '../utils/app_values.dart';

class AuthSectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const AuthSectionHeader({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: SvgPicture.asset(
            isDark ? AppImages.logoLightTheme : AppImages.logoAuthColored,
            width: 56,
            height: 56,
          ),
        ),
        SizedBox(height: AppValues.height4),
        Text(
          title,
          style: AppTextStyles.robotoSixteen.copyWith(
            fontWeight: FontWeight.w600,
            color: isDark ? AppColors.white : AppColors.primaryBlueDark,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppValues.height4),
        Text(
          subtitle,
          style: AppTextStyles.robotoFourteen.copyWith(
            color: isDark ? AppColors.white : AppColors.greyText,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
