import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../enums/booking_status.dart';
import '../enums/notification_type.dart';
import '../utils/app_images.dart';
import 'package:fieldify/l10n/app_translations.dart';

class Functions {
  static String convertStringTimestampToDate(String timestampString) {
    try {
      DateTime date = DateTime.parse(timestampString);

      return DateFormat('d, MMM yyyy').format(date);
    } catch (e) {
      return "-";
    }
  }

  static String capitalizeEachWord(String text) {
    return text.split(' ').map((word) {
      if (word.isEmpty) return word;

      return word[0].toUpperCase() + word.substring(1);
    }).join(' ');
  }

  static Future<void> openMaps(String address) async {
    String query = Uri.encodeComponent(address);
    final Uri url =
        Uri.parse('https://www.google.com/maps/search/?api=1&query=$query');

    if (!await launchUrl(url)) {
      throw 'Could not open Google Maps for address: $address';
    }
  }

  static void visitUrl({required String url}) async {
    if (!url.startsWith('https://')) {
      url = 'https://$url';
    }
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
    }
  }

  static DateTime stringToDateTimeObject(String date, String time) {
    String dateTimeString = "$date $time";
    DateFormat format = DateFormat("yyyy-MM-dd hh:mm a");

    return format.parse(dateTimeString);
  }

  bool isValidId(String id) {
    RegExp regExp = RegExp(r'^S\d{8}$');

    return regExp.hasMatch(id);
  }

  bool isValidEmail(String email) {
    RegExp regExp = RegExp(r'^[a-zA-Z0-9._%+-]+@mail\.bcu\.ac\.uk$');

    return regExp.hasMatch(email);
  }

  static String getGreetingMessage() {
    final hour = DateTime.now().hour;
    
    if (hour >= 5 && hour < 12) {
      return 'morning';
    } else if (hour >= 12 && hour < 17) {
      return 'noon';
    } else {
      return 'evening';
    }
  }

  static String getLocalizedGreetingText(String greetingKey) {
    switch (greetingKey) {
      case 'morning':
        return AppTranslations.morning.tr;
      case 'noon':
        return AppTranslations.noon.tr;
      case 'evening':
        return AppTranslations.evening.tr;
      default:
        return AppTranslations.morning.tr;
    }
  }

  static String getBookingStatusText(BookingStatus status) {
    switch (status) {
      case BookingStatus.completed:
        return 'Completed';
      case BookingStatus.upcoming:
        return 'Upcoming';
      case BookingStatus.cancelled:
        return 'Cancelled';
      case BookingStatus.pending:
        return 'Pending';
    }
  }

  static String getRelativeTimeString(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return 'now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inDays == 1) {
      return 'yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '${weeks} week${weeks > 1 ? 's' : ''} ago';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '${months} month${months > 1 ? 's' : ''} ago';
    } else {
      final years = (difference.inDays / 365).floor();
      return '${years} year${years > 1 ? 's' : ''} ago';
    }
  }
//
  static String getNotificationIconPath(NotificationType type) {
    switch (type) {
      case NotificationType.bookingConfirmed:
        return AppImages.notificationSuccessIcon;
      case NotificationType.bookingCancelled:
        return AppImages.notificationCancelIcon;
      case NotificationType.paymentSuccessful:
        return AppImages.notificationSuccessIcon;
      case NotificationType.reminderUpcoming:
        return AppImages.notificationReminderIcon;
      case NotificationType.refunded:
        return AppImages.promoCodeNotificationIcon;
      case NotificationType.promoCode:
        return AppImages.promoCodeNotificationIcon;
   
    
    }
  }

  static String getNotificationTitleKey(NotificationType type) {
    switch (type) {
      case NotificationType.bookingConfirmed:
        return AppTranslations.bookingConfirmed;
      case NotificationType.bookingCancelled:
        return AppTranslations.bookingCancelled;
      case NotificationType.paymentSuccessful:
        return AppTranslations.paymentSuccessful;
      case NotificationType.reminderUpcoming:
        return AppTranslations.reminderUpcoming;
      case NotificationType.refunded:
        return AppTranslations.refunded;
      case NotificationType.promoCode:
        return AppTranslations.promoCode;
    
    }
  }

  static String getNotificationSubtitleKey(NotificationType type) {
    switch (type) {
      case NotificationType.bookingConfirmed:
        return AppTranslations.bookingConfirmedSubtitle;
      case NotificationType.bookingCancelled:
        return AppTranslations.bookingCancelledSubtitle;
      case NotificationType.paymentSuccessful:
        return AppTranslations.paymentSuccessfulSubtitle;
      case NotificationType.reminderUpcoming:
        return AppTranslations.reminderUpcomingSubtitle;
      case NotificationType.refunded:
        return AppTranslations.refundedSubtitle;
      case NotificationType.promoCode:
        return AppTranslations.promoCodeSubtitle;
     
    }
  }
}
