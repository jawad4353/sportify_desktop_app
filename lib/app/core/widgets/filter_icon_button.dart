import 'package:flutter/material.dart';
import 'package:fieldify/app/core/utils/app_colors.dart';
import 'package:fieldify/app/core/utils/app_values.dart';

class FilterIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final double? size;
  final double? iconSize;

  const FilterIconButton({
    Key? key,
    required this.onTap,
    this.icon = Icons.tune,
    this.size,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size ?? AppValues.width48,
        height: size ?? AppValues.width48,
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          border: Border.all(
            color: isDark ? AppColors.darkDivider : AppColors.lightDivider,
          ),
          borderRadius: BorderRadius.circular(AppValues.radius8),
          boxShadow: [
            BoxShadow(
              color: theme.shadowColor.withOpacity(0.1),
              blurRadius: 4,
              spreadRadius: 0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: theme.primaryColor,
          size: iconSize ?? AppValues.font20,
        ),
      ),
    );
  }
}
