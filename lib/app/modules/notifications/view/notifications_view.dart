import 'package:fieldify/app/core/base/base_view.dart';
import 'package:fieldify/app/core/utils/app_colors.dart';
import 'package:fieldify/app/core/utils/app_images.dart';
import 'package:fieldify/app/core/utils/app_values.dart';
import 'package:fieldify/app/core/widgets/custom_appbar.dart';
import 'package:fieldify/app/modules/notifications/controller/notifications_controller.dart';
import 'package:fieldify/app/modules/notifications/widgets/empty_notifications_widget.dart';
import 'package:fieldify/app/modules/notifications/widgets/notification_card.dart';
import 'package:fieldify/l10n/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NotificationsView extends BaseView<NotificationsController> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: isDarkMode ? AppColors.darkBackground : AppColors.white,
      appBar: AppBars.customAppBar(
        context: context,
        title: AppTranslations.notifications.tr,
        leadingWidth: AppValues.width50,

      ),
      body: Obx(
        () => controller.notifications.isEmpty
            ? const EmptyNotificationsWidget()
            : ListView.builder(
                itemCount: controller.notifications.length,
                itemBuilder: (context, index) {
                  return NotificationCard(
                    notification: controller.notifications[index],
                  );
                },
              ),
      ),
    );
  }
}
