import 'package:flutter/material.dart';
import 'package:fieldify/app/core/utils/app_colors.dart';
import 'package:fieldify/app/core/utils/app_text_styles.dart';
import 'package:fieldify/app/core/utils/app_values.dart';

class AmenityTag extends StatelessWidget {
  final String amenity;

  const AmenityTag({
    Key? key,
    required this.amenity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppValues.width12,
        vertical: AppValues.height6,
      ),
      margin: EdgeInsets.only(right: AppValues.width8, bottom: AppValues.height8),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkSurface
            : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(AppValues.radius8),
        border: Border.all(
          color: isDark
              ? AppColors.darkBorder
              : AppColors.lightBorder,
          width: 1,
        ),
      ),
      child: Text(
        amenity,
        style: AppTextStyles.robotoFourteen.copyWith(
          color: isDark
              ? AppColors.darkTextPrimary
              : AppColors.lightTextPrimary,
        ),
      ),
    );
  }
}
