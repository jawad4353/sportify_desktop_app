import 'dart:async';

import 'package:fieldify/app/core/app_functions/app_functions.dart';
import 'package:fieldify/app/core/base/base_controller.dart';
import 'package:fieldify/app/core/utils/app_images.dart';
import 'package:fieldify/app/core/utils/app_prefs.dart';
import 'package:fieldify/app/data/data/preference/preference_manager.dart';
import 'package:fieldify/app/data/model/venue_model.dart';
import 'package:fieldify/app/modules/home/models/sport_model.dart';
import 'package:fieldify/app/routes/app_pages.dart';
import 'package:fieldify/l10n/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends BaseController {
  final searchController = TextEditingController();

  final greetingText = ''.obs;
  final userName = 'User'.obs;
  final isLoading = true.obs;

  late PageController homeCardsPageController;
  final homeCardsCurrentPage = 0.obs;
  Timer? _homeCardsTimer;
  Timer? _loadingTimer;

  final List<String> homeCardImages = [
    AppImages.homeCardOne,
    AppImages.homeCardTwo,
    AppImages.homeCardThree,
  ];

  PreferenceManager get _preferenceManager => Get.find<PreferenceManager>(
        tag: (PreferenceManager).toString(),
      );

  @override
  void onInit() {
    super.onInit();
    homeCardsPageController = PageController(initialPage: 0);
    _loadUserData();
    _startLoadingTimer();
    _startHomeCardsAutoTransition();
  }

  void _startHomeCardsAutoTransition() {
    _homeCardsTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (homeCardsPageController.hasClients) {
        int nextPage = homeCardsCurrentPage.value + 1;
        if (nextPage >= homeCardImages.length) {
          nextPage = 0;
        }
        homeCardsPageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _startLoadingTimer() {
    _loadingTimer = Timer(const Duration(seconds: 3), () {
      isLoading.value = false;
    });
  }

  void onHomeCardsPageChanged(int index) {
    homeCardsCurrentPage.value = index;
  }

  Future<void> _loadUserData() async {
    greetingText.value = getGreetingText();
    userName.value = await getUserName();
  }

  final List<VenueModel> outdoorVenues = [
    VenueModel(
      id: '1',
      venueName: 'Red Meadows',
      rating: '4.5',
      distance: '~1.8 km',
      sports: 'Football, Cricket',
      imageUrl: 'https://fun-orange-xogqsdtvup.edgeone.app/Venue-image.png',
    ),
    VenueModel(
      id: '2',
      venueName: 'Green Field Sports',
      rating: '4.2',
      distance: '~2.3 km',
      sports: 'Football, Padel',
      imageUrl: 'https://fun-orange-xogqsdtvup.edgeone.app/Venue-image.png',
    ),
    VenueModel(
      id: '3',
      venueName: 'Outdoor Arena',
      rating: '4.7',
      distance: '~3.1 km',
      sports: 'Cricket, Football',
      imageUrl: 'https://fun-orange-xogqsdtvup.edgeone.app/Venue-image.png',
    ),
  ];

  final List<VenueModel> indoorVenues = [
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

  final List<SportModel> sports = [
    SportModel(
        translationKey: AppTranslations.pedal, iconPath: AppImages.pedalIcon),
    SportModel(
        translationKey: AppTranslations.football,
        iconPath: AppImages.footBallIcon),
    SportModel(
        translationKey: AppTranslations.basketball,
        iconPath: AppImages.basketBallIcon),
    SportModel(
        translationKey: AppTranslations.badminton,
        iconPath: AppImages.badmintonIcon),
    SportModel(
        translationKey: AppTranslations.volleyball,
        iconPath: AppImages.volleyBallIcon),
    SportModel(
        translationKey: AppTranslations.tableTennis,
        iconPath: AppImages.tableTennisIcon),
    SportModel(
        translationKey: AppTranslations.cricket,
        iconPath: AppImages.cricketIcon),
    SportModel(
        translationKey: AppTranslations.gym, iconPath: AppImages.dumbullIcon),
    SportModel(
        translationKey: AppTranslations.snooker,
        iconPath: AppImages.snookerIcon),
  ];

  String getGreetingMessage() {
    final greetingKey = Functions.getGreetingMessage();

    return greetingKey;
  }

  String getGreetingText() {
    final greetingKey = getGreetingMessage();

    return Functions.getLocalizedGreetingText(greetingKey);
  }

  Future<String> getUserName() async {
    final userName = await _preferenceManager.getString(
      AppPrefs.name,
      defaultValue: 'User',
    );

    return userName;
  }

  void onSearchChanged(String value) {
    assert(value.isNotEmpty || value.isEmpty);
  }

  void onSearchSubmitted(String value) {
    assert(value.isNotEmpty || value.isEmpty);
  }

  void onFavoritePressed() {
    Get.toNamed(Routes.FAVORITE);
  }

  void onNotificationsPressed() {
    Get.toNamed(Routes.NOTIFICATIONS);
  }

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

  void onFavoriteTap(VenueModel venue) {
    // Toggle favorite status and update the list
    final isOutdoor = outdoorVenues.indexWhere((v) => v.id == venue.id) != -1;
    if (isOutdoor) {
      final index = outdoorVenues.indexWhere((v) => v.id == venue.id);
      if (index != -1) {
        final updatedVenue = VenueModel(
          id: venue.id,
          venueName: venue.venueName,
          rating: venue.rating,
          distance: venue.distance,
          sports: venue.sports,
          imageUrl: venue.imageUrl,
          price: venue.price,
          operatingHours: venue.operatingHours,
          address: venue.address,
          fullAddress: venue.fullAddress,
          sportsList: venue.sportsList,
          amenities: venue.amenities,
          imageUrls: venue.imageUrls,
          reviewCount: venue.reviewCount,
          isFavorite: !(venue.isFavorite ?? false),
        );
        outdoorVenues[index] = updatedVenue;
      }
    } else {
      final index = indoorVenues.indexWhere((v) => v.id == venue.id);
      if (index != -1) {
        final updatedVenue = VenueModel(
          id: venue.id,
          venueName: venue.venueName,
          rating: venue.rating,
          distance: venue.distance,
          sports: venue.sports,
          imageUrl: venue.imageUrl,
          price: venue.price,
          operatingHours: venue.operatingHours,
          address: venue.address,
          fullAddress: venue.fullAddress,
          sportsList: venue.sportsList,
          amenities: venue.amenities,
          imageUrls: venue.imageUrls,
          reviewCount: venue.reviewCount,
          isFavorite: !(venue.isFavorite ?? false),
        );
        indoorVenues[index] = updatedVenue;
      }
    }
  }

  @override
  void onClose() {
    _homeCardsTimer?.cancel();
    _loadingTimer?.cancel();
    homeCardsPageController.dispose();
    searchController.dispose();
    super.onClose();
  }
}
