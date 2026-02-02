import 'package:flutter/material.dart';
import 'package:fieldify/app/core/utils/app_colors.dart';

class HorizontalDivider extends StatelessWidget {
  final double? height;
  final double? thickness;
  final Color? color;
  final EdgeInsets? margin;

  const HorizontalDivider({
    Key? key,
    this.height,
    this.thickness,
    this.color,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      height: height ?? 1,
      margin: margin,
      decoration: BoxDecoration(
        color: color ??
            (isDark ? AppColors.darkDivider : AppColors.lightDivider),
        border: Border(
          top: BorderSide(
            color: color ??
                (isDark ? AppColors.darkDivider : AppColors.lightDivider),
            width: thickness ?? 1,
          ),
        ),
      ),
    );
  }
}
