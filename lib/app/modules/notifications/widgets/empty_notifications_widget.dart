import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/utils/app_text_styles.dart';
import '../../../core/utils/app_values.dart';
import 'package:fieldify/l10n/app_translations.dart';

class EmptyNotificationsWidget extends StatelessWidget {
  const EmptyNotificationsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppValues.padding30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppImages.emptyNotificationIcon,
              width: AppValues.width80,
              height: AppValues.width80,
              colorFilter: ColorFilter.mode(
                AppColors.greyText.withOpacity(0.5),
                BlendMode.srcIn,
              ),
            ),
            SizedBox(height: AppValues.height24),
            Text(
              AppTranslations.noNotifications.tr,
              style: AppTextStyles.robotoTwentyMedium.copyWith(
                fontWeight: FontWeight.w600,
                color: isDark ? AppColors.white : AppColors.primaryBlueDark,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppValues.height12),
            Text(
              AppTranslations.notificationsEmptyMessage.tr,
              style: AppTextStyles.robotoFourteen.copyWith(
                color: AppColors.greyText,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
