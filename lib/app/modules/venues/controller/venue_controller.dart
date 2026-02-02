import 'dart:async';

import 'package:fieldify/app/core/base/base_controller.dart';
import 'package:fieldify/app/core/enums/filter_enums.dart';
import 'package:fieldify/app/data/model/venue_model.dart';
import 'package:fieldify/app/modules/venues/widgets/venue_filter_dialog.dart';
import 'package:fieldify/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VenueController extends BaseController {
  final searchController = TextEditingController();

  final selectedFilterCategory = FilterCategory.sort.obs;
  final selectedSortOption = SortOption.recommended.obs;
  final isLoading = true.obs;
  Timer? _loadingTimer;

  @override
  void onInit() {
    super.onInit();
    _startLoadingTimer();
  }

  final List<VenueModel> venues = [
    VenueModel(
      id: '6',
      venueName: 'ABL Indoors',
      rating: '4.8',
      distance: '~1.2 km',
      sports: 'Basketball, Badminton',
      imageUrl: 'https://fun-orange-xogqsdtvup.edgeone.app/Venue-image.png',
    ),
    VenueModel(
      id: '7',
      venueName: 'Indoor Sports Complex',
      rating: '4.4',
      distance: '~2.5 km',
      sports: 'Table Tennis, Snooker',
      imageUrl: 'https://fun-orange-xogqsdtvup.edgeone.app/Venue-image.png',
    ),
    VenueModel(
      id: '8',
      venueName: 'City Gym & Sports',
      rating: '4.5',
      distance: '~1.9 km',
      sports: 'Gym, Foosball',
      imageUrl: 'https://fun-orange-xogqsdtvup.edgeone.app/Venue-image.png',
    ),
    VenueModel(
      id: '6',
      venueName: 'ABL Indoors',
      rating: '4.8',
      distance: '~1.2 km',
      sports: 'Basketball, Badminton',
      imageUrl: 'https://fun-orange-xogqsdtvup.edgeone.app/Venue-image.png',
    ),
    VenueModel(
      id: '7',
      venueName: 'Indoor Sports Complex',
      rating: '4.4',
      distance: '~2.5 km',
      sports: 'Table Tennis, Snooker',
      imageUrl: 'https://fun-orange-xogqsdtvup.edgeone.app/Venue-image.png',
    ),
    VenueModel(
      id: '8',
      venueName: 'City Gym & Sports',
      rating: '4.5',
      distance: '~1.9 km',
      sports: 'Gym, Foosball',
      imageUrl: 'https://fun-orange-xogqsdtvup.edgeone.app/Venue-image.png',
    ),
  ];

  void onVenueTap(VenueModel venue) {
    final detailedVenue = VenueModel(
      id: venue.id,
      venueName: venue.venueName,
      rating: venue.rating,
      distance: venue.distance,
      sports: venue.sports,
      imageUrl: venue.imageUrl,
      price: '₹1100 Onwards',
      operatingHours: 'Open 24 hours',
      address: '5P4F+HR4, Adoor Bypass Road',
      fullAddress: '5P4F+HR4, Adoor Bypass Road, Adoor, Kerala 691523',
      sportsList: venue.sports.split(',').map((s) => s.trim()).toList(),
      amenities: ['Parking', 'Changing room', 'Toilets', 'First Aid'],
      imageUrls: [
        venue.imageUrl,
        venue.imageUrl,
        venue.imageUrl,
        venue.imageUrl,
        venue.imageUrl,
        venue.imageUrl,
        venue.imageUrl
      ],
      reviewCount: 175,
      isFavorite: false,
    );
    Get.toNamed(Routes.VENUE_DETAILS, arguments: detailedVenue);
  }

  void selectFilterCategory(FilterCategory category) {
    selectedFilterCategory.value = category;
  }

  void selectSortOption(SortOption option) {
    selectedSortOption.value = option;
  }

  void resetFilters() {
    selectedSortOption.value = SortOption.recommended;
  }

  void applyFilters() {
    assert(true);
  }

  void showFilterDialog() {
    Get.dialog(const VenueFilterDialog());
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
    super.onClose();
  }
}
