import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fieldify/app/core/utils/app_colors.dart';
import 'package:fieldify/app/core/utils/app_text_styles.dart';
import 'package:fieldify/app/core/utils/app_values.dart';
import 'package:fieldify/l10n/app_translations.dart';

class ShowMoreReviewsTile extends StatelessWidget {
  final VoidCallback? onTap;

  const ShowMoreReviewsTile({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: AppValues.height12),
        padding: EdgeInsets.symmetric(
          horizontal: AppValues.padding16,
          vertical: AppValues.height16,
        ),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkCard : AppColors.lightCard,
          borderRadius: BorderRadius.circular(AppValues.radius10),
          boxShadow: [
            BoxShadow(
              color: theme.shadowColor.withOpacity(0.1),
              blurRadius: 4,
              spreadRadius: 0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppTranslations.showMoreReviews.tr,
              style: AppTextStyles.robotoFourteen.copyWith(
                color: isDark
                    ? AppColors.darkTextPrimary
                    : AppColors.lightTextPrimary,
                fontWeight: FontWeight.w400,
              ),
            ),
            Icon(
              Icons.chevron_right,
              size: AppValues.font20,
              color: AppColors.greyText,
            ),
          ],
        ),
      ),
    );
  }
}
