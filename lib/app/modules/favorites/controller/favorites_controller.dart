import 'package:fieldify/app/core/base/base_controller.dart';
import 'package:fieldify/app/data/model/venue_model.dart';
import 'package:get/get.dart';

class FavoritesController extends BaseController {
  final favorites = <VenueModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadFavorites();
  }

  void _loadFavorites() {
    // Sample data - in a real app, this would come from a database or API
    favorites.value = [
      VenueModel(
        id: '1',
        venueName: 'Sports Arena Johar Town',
        rating: '4.5',
        distance: '2.5 km',
        sports: 'Cricket, Football',
        imageUrl: 'assets/images/Venue-image.png',
        price: '\$150/hour',
        operatingHours: '6:00 AM - 10:00 PM',
        address: 'r1 Block Johar Town Downtown,Lahore',
        fullAddress: '123 Sports Street, Downtown City',
        sportsList: ['Cricket', 'Football', 'Badminton'],
        amenities: ['Parking', 'WiFi', 'Cafe'],
        imageUrls: [
          'assets/images/Venue-image.png',
          'assets/images/Venue-image.png',
        ],
        reviewCount: 245,
        isFavorite: true,
      ),
      VenueModel(
        id: '2',
        venueName: 'Elite Sports Club',
        rating: '4.8',
        distance: '3.2 km',
        sports: 'Tennis, Basketball',
        imageUrl: 'assets/images/Venue-image.png',
        price: '\$200/hour',
        operatingHours: '7:00 AM - 11:00 PM',
        address: 'Midtown',
        fullAddress: '456 Game Avenue, Midtown City',
        sportsList: ['Tennis', 'Basketball'],
        amenities: ['Parking', 'Locker Room', 'Cafe'],
        imageUrls: [
          'assets/images/Venue-image.png',
          'assets/images/Venue-image.png',
        ],
        reviewCount: 312,
        isFavorite: true,
      ),
    ];
  }

  void onVenueTap(VenueModel venue) {
   return ;
  }

  void toggleFavorite(VenueModel venue) {
    // Update favorite status
    final index = favorites.indexWhere((v) => v.id == venue.id);
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
      favorites[index] = updatedVenue;
      favorites.refresh();
    }
  }
}
