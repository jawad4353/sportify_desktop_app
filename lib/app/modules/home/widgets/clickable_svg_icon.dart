import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_values.dart';

class ClickableSvgIcon extends StatelessWidget {
  final String iconPath;
  final VoidCallback onPress;
  final double? width;
  final double? height;

  const ClickableSvgIcon({
    Key? key,
    required this.iconPath,
    required this.onPress,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return InkWell(
      onTap: onPress,
      borderRadius: BorderRadius.circular(AppValues.radius8),
      splashColor: isDark
          ? AppColors.darkTextSecondary.withOpacity(0.2)
          : AppColors.greyText.withOpacity(0.1),
      highlightColor: isDark
          ? AppColors.darkTextSecondary.withOpacity(0.1)
          : AppColors.greyText.withOpacity(0.05),
      child: Padding(
        padding: EdgeInsets.all(AppValues.width8),
        child: SvgPicture.asset(
          iconPath,
          width: width ?? AppValues.width24,
          height: height ?? AppValues.width24,
          colorFilter: ColorFilter.mode(
            isDark ? AppColors.white : AppColors.primaryBlueDark,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
