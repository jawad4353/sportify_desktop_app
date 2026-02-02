import 'package:fieldify/app/core/enums/notification_type.dart';

class NotificationModel {
  final String id;
  final String title;
  final String subtitle;
  final String date;
  final String icon;
  final NotificationType type;

  NotificationModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.icon,
    required this.type,
  });
}
