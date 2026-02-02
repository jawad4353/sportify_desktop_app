import 'package:flutter/material.dart';
import 'package:fieldify/app/core/utils/app_colors.dart';
import 'package:fieldify/app/core/utils/app_values.dart';

class ButtonImageIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? backgroundColor;
  final double? iconSize;
  final double? buttonSize;

  const ButtonImageIcon({
    Key? key,
    required this.icon,
    required this.onTap,
    this.iconColor,
    this.backgroundColor,
    this.iconSize,
    this.buttonSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: buttonSize ?? AppValues.width40,
        height: buttonSize ?? AppValues.width40,
        decoration: BoxDecoration(
          color: backgroundColor ?? 
              (isDark ? Colors.black54 : Colors.black26),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: iconColor ?? AppColors.white,
          size: iconSize ?? AppValues.font20,
        ),
      ),
    );
  }
}
