import 'package:fieldify/app/core/base/base_controller.dart';
import 'package:fieldify/app/core/app_functions/app_functions.dart';
import 'package:fieldify/app/core/enums/notification_type.dart';
import 'package:get/get.dart';

import '../models/notification_model.dart';

class NotificationsController extends BaseController {
  final notifications = <NotificationModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadNotifications();
  }

  void _loadNotifications() {
    final now = DateTime.now();
    notifications.value = [
      NotificationModel(
        id: '1',
        title: Functions.getNotificationTitleKey(NotificationType.bookingConfirmed),
        subtitle: Functions.getNotificationSubtitleKey(NotificationType.bookingConfirmed),
        date: Functions.getRelativeTimeString(now.subtract(const Duration(hours: 2))),
        icon: Functions.getNotificationIconPath(NotificationType.bookingConfirmed),
        type: NotificationType.bookingConfirmed,
      ),
      NotificationModel(
        id: '2',
        title: Functions.getNotificationTitleKey(NotificationType.paymentSuccessful),
        subtitle: Functions.getNotificationSubtitleKey(NotificationType.paymentSuccessful),
        date: Functions.getRelativeTimeString(now.subtract(const Duration(days: 1))),
        icon: Functions.getNotificationIconPath(NotificationType.paymentSuccessful),
        type: NotificationType.paymentSuccessful,
      ),
      NotificationModel(
        id: '3',
        title: Functions.getNotificationTitleKey(NotificationType.reminderUpcoming),
        subtitle: Functions.getNotificationSubtitleKey(NotificationType.reminderUpcoming),
        date: Functions.getRelativeTimeString(now.subtract(const Duration(days: 2))),
        icon: Functions.getNotificationIconPath(NotificationType.reminderUpcoming),
        type: NotificationType.reminderUpcoming,
      ),
      NotificationModel(
        id: '4',
        title: Functions.getNotificationTitleKey(NotificationType.bookingCancelled),
        subtitle: Functions.getNotificationSubtitleKey(NotificationType.bookingCancelled),
        date: Functions.getRelativeTimeString(now.subtract(const Duration(days: 3))),
        icon: Functions.getNotificationIconPath(NotificationType.bookingCancelled),
        type: NotificationType.bookingCancelled,
      ),
      NotificationModel(
        id: '5',
        title: Functions.getNotificationTitleKey(NotificationType.refunded),
        subtitle: Functions.getNotificationSubtitleKey(NotificationType.refunded),
        date: Functions.getRelativeTimeString(now.subtract(const Duration(days: 7))),
        icon: Functions.getNotificationIconPath(NotificationType.refunded),
        type: NotificationType.refunded,
      ),
      NotificationModel(
        id: '6',
        title: Functions.getNotificationTitleKey(NotificationType.promoCode),
        subtitle: Functions.getNotificationSubtitleKey(NotificationType.promoCode),
        date: Functions.getRelativeTimeString(now.subtract(const Duration(hours: 3))),
        icon: Functions.getNotificationIconPath(NotificationType.promoCode),
        type: NotificationType.promoCode,
      ),
    ];
  }
}
