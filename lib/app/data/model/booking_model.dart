import '../../core/enums/booking_status.dart';

class BookingModel {
  final String id;
  final String venueName;
  final String sport;
  final String date;
  final String startTime;
  final String endTime;
  final String location;
  final String distance;
  final String imageUrl;
  final BookingStatus status;

  BookingModel({
    required this.id,
    required this.venueName,
    required this.sport,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.location,
    required this.distance,
    required this.imageUrl,
    required this.status,
  });
}
