class VenueModel {
  final String id;
  final String venueName;
  final String rating;
  final String distance;
  final String sports;
  final String imageUrl;
  final String? price;
  final String? operatingHours;
  final String? address;
  final String? fullAddress;
  final List<String>? sportsList;
  final List<String>? amenities;
  final List<String>? imageUrls;
  final int? reviewCount;
  final bool? isFavorite;

  VenueModel({
    required this.id,
    required this.venueName,
    required this.rating,
    required this.distance,
    required this.sports,
    required this.imageUrl,
    this.price,
    this.operatingHours,
    this.address,
    this.fullAddress,
    this.sportsList,
    this.amenities,
    this.imageUrls,
    this.reviewCount,
    this.isFavorite,
  });
}
