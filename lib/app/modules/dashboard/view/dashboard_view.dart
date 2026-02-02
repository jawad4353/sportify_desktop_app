import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:fieldify/app/core/base/base_view.dart';
import 'package:fieldify/app/modules/dashboard/controller/dashboard_controller.dart';
import 'package:fieldify/l10n/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_colors.dart';

class DashboardView extends BaseView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? AppColors.black : AppColors.white;

    return Obx(() {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: controller.screens[controller.selectedIndex.value],
        ),
        bottomNavigationBar: SafeArea(
          top: false,
          bottom: true,
          child: BottomBarFloating(
            enableShadow: false,

            items: [
            TabItem(
              icon: FontAwesomeIcons.houseCrack,
              title: AppTranslations.home.tr,
            ),
            TabItem(
              icon: FontAwesomeIcons.locationCrosshairs,
              title: AppTranslations.venues.tr,
            ),
            TabItem(
              icon: FontAwesomeIcons.calendarCheck,
              title: AppTranslations.bookings.tr,
            ),
            TabItem(
              icon: FontAwesomeIcons.receipt,
              title: AppTranslations.refunds.tr,
            ),
            TabItem(
              icon: FontAwesomeIcons.gear,
              title: AppTranslations.settings.tr,
            ),
          ],
          backgroundColor: backgroundColor,
          color: isDarkMode ? AppColors.darkTextSecondary : AppColors.greyText,
          colorSelected: AppColors.primaryBlue,
          indexSelected: controller.selectedIndex.value,
          onTap: (index) {
            controller.selectedIndex.value = index;
          },
          animated: true,
          ),
        ),
      );
    });
  }
}
