import 'package:fieldify/app/core/base/base_view.dart';
import 'package:fieldify/app/core/utils/app_colors.dart';
import 'package:fieldify/app/core/utils/app_images.dart';
import 'package:fieldify/app/core/utils/app_values.dart';
import 'package:fieldify/app/modules/settings/controller/settings_controller.dart';
import 'package:fieldify/app/modules/settings/widgets/language_toggle_tile.dart';
import 'package:fieldify/app/modules/settings/widgets/profile_card.dart';
import 'package:fieldify/app/modules/settings/widgets/section_header.dart';
import 'package:fieldify/app/modules/settings/widgets/settings_tile.dart';
import 'package:fieldify/app/modules/settings/widgets/theme_toggle_tile.dart';
import 'package:fieldify/l10n/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/custom_appbar.dart';

class SettingsView extends BaseView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: isDarkMode ? AppColors.darkBackground : AppColors.white,
      appBar: AppBars.customAppBar(
        context: context, additionalHeight:0,
        title: AppTranslations.settings.tr,
        leadingWidth: AppValues.width40,
        showLeading: false

      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileCard(),
            SizedBox(height: AppValues.height8),
            SectionHeader(title: AppTranslations.setting.tr),
            SettingsTile(
              title: AppTranslations.bookings.tr,
              iconPath: AppImages.bookingsSettingsIcon,
              onTap: () {
                return;
              },
            ),
            SizedBox(height: AppValues.height8),
            SettingsTile(
              title: AppTranslations.notifications.tr,
              iconPath: AppImages.notificationsIcon,
              onTap: () {
                return;
              },
            ),
            SizedBox(height: AppValues.height8),
            const ThemeToggleTile(),
            SizedBox(height: AppValues.height8),
            const LanguageToggleTile(),
            SizedBox(height: AppValues.height8),
            SectionHeader(title: AppTranslations.support.tr),
            SettingsTile(
              title: AppTranslations.supportForm.tr,
              iconPath: AppImages.supportIcon,
              onTap: () {
                return;
              },
            ),
            SizedBox(height: AppValues.height20),
          ],
        ),
      ),
    );
  }
}
