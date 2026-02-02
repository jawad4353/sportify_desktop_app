import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_styles.dart';
import '../../../core/utils/app_values.dart';

class SportItem extends StatelessWidget {
  final String name;
  final String iconPath;
  final VoidCallback? onTap;

  const SportItem({
    Key? key,
    required this.name,
    required this.iconPath,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppValues.width80,
        margin: EdgeInsets.only(right: AppValues.width16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconPath,
              width: AppValues.width30,
              height: AppValues.width30,
            ),
            SizedBox(height: AppValues.height8),
            Text(
              name,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.robotoTwelveMedium.copyWith(
                color: isDark ? AppColors.white : AppColors.primaryBlueDark,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
