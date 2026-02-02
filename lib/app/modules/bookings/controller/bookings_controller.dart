import 'dart:async';

import 'package:fieldify/app/core/app_functions/app_functions.dart';
import 'package:fieldify/app/core/base/base_controller.dart';
import 'package:fieldify/app/core/enums/booking_status.dart';
import 'package:fieldify/app/core/enums/filter_enums.dart';
import 'package:fieldify/app/data/model/booking_model.dart';
import 'package:fieldify/app/modules/bookings/widgets/booking_filter_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingsController extends BaseController {
  final searchController = TextEditingController();
  final reviewController = TextEditingController();

  final selectedFilterCategory = BookingFilterCategory.status.obs;
  final selectedStatusFilter = BookingStatusFilter.all.obs;
  final selectedDateFilter = BookingDateFilter.all.obs;
  final isLoading = true.obs;
  final selectedRating = 0.obs;
  Timer? _loadingTimer;

  String getBookingStatusText(BookingStatus status) {
    return Functions.getBookingStatusText(status);
  }

  @override
  void onInit() {
    super.onInit();
    _startLoadingTimer();
  }

  final List<BookingModel> bookings = [
    BookingModel(
      id: '1',
      venueName: 'Red Meadows',
      sport: '5x5, Football',
      date: 'Wed, 04 Sep 2024',
      startTime: '09:00 am',
      endTime: '10:00 am',
      location: 'Adoor Bypass',
      distance: '~1.8 km',
      imageUrl: 'https://fun-orange-xogqsdtvup.edgeone.app/Venue-image.png',
      status: BookingStatus.upcoming,
    ),
    BookingModel(
      id: '2',
      venueName: 'ABL Indoors',
      sport: 'Basketball',
      date: 'Sun, 01 Sep 2024',
      startTime: '09:00 am',
      endTime: '10:00 am',
      location: 'Adoor Bypass',
      distance: '~1.8 km',
      imageUrl: 'https://fun-orange-xogqsdtvup.edgeone.app/Venue-image.png',
      status: BookingStatus.completed,
    ),
    BookingModel(
      id: '3',
      venueName: 'Sports Arena',
      sport: 'Table Tennis',
      date: 'Mon, 05 Sep 2024',
      startTime: '02:00 pm',
      endTime: '03:00 pm',
      location: 'City Center',
      distance: '~2.5 km',
      imageUrl: 'https://fun-orange-xogqsdtvup.edgeone.app/Venue-image.png',
      status: BookingStatus.upcoming,
    ),
    BookingModel(
      id: '4',
      venueName: 'City Sports Club',
      sport: 'Badminton',
      date: 'Tue, 03 Sep 2024',
      startTime: '11:00 am',
      endTime: '12:00 pm',
      location: 'Downtown',
      distance: '~3.2 km',
      imageUrl: 'https://fun-orange-xogqsdtvup.edgeone.app/Venue-image.png',
      status: BookingStatus.cancelled,
    ),
  ];

  void selectFilterCategory(BookingFilterCategory category) {
    selectedFilterCategory.value = category;
  }

  void selectStatusFilter(BookingStatusFilter filter) {
    selectedStatusFilter.value = filter;
  }

  void selectDateFilter(BookingDateFilter filter) {
    selectedDateFilter.value = filter;
  }

  void resetFilters() {
    selectedStatusFilter.value = BookingStatusFilter.all;
    selectedDateFilter.value = BookingDateFilter.all;
  }

  void applyFilters() {
    assert(true);
  }

  void showFilterDialog() {
    Get.dialog(const BookingFilterDialog());
  }

  void selectRating(int rating) {
    selectedRating.value = rating;
  }

  void _startLoadingTimer() {
    _loadingTimer = Timer(const Duration(seconds: 3), () {
      isLoading.value = false;
    });
  }

  @override
  void onClose() {
    _loadingTimer?.cancel();
    searchController.dispose();
    reviewController.dispose();
    super.onClose();
  }
}
