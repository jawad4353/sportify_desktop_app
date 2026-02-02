import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/utils/app_text_styles.dart';
import '../../../core/utils/app_values.dart';
import '../../../core/widgets/rating_widget.dart';
import '../../../data/model/venue_model.dart';

class FavoriteCard extends StatelessWidget {
  final VenueModel venue;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;

  const FavoriteCard({
    Key? key,
    required this.venue,
    this.onTap,
    this.onFavoriteTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: AppValues.padding16,
          vertical: AppValues.height12,
        ),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkCard : AppColors.lightCard,
          borderRadius: BorderRadius.circular(AppValues.radius10),
          boxShadow: [
            BoxShadow(
              color: theme.shadowColor.withOpacity(isDark ? 0.3 : 0.1),
              blurRadius: 8,
              spreadRadius: 0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with favorite icon
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: AppValues.height180,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppValues.radius10),
                      topRight: Radius.circular(AppValues.radius10),
                    ),
                  ),
                  child: Image.network(
                    venue.imageUrl.isEmpty
                        ? 'https://fun-orange-xogqsdtvup.edgeone.app/Venue-image.png'
                        : venue.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Icon(
                          Icons.image_not_supported,
                          color: AppColors.greyText,
                        ),
                      );
                    },
                  ),
                ),
                // Favorite Icon
                if (onFavoriteTap != null)
                  Positioned(
                    top: AppValues.padding12,
                    right: AppValues.padding12,
                    child: GestureDetector(
                      onTap: onFavoriteTap,
                      child: Container(
                        padding: EdgeInsets.all(AppValues.padding8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.95),
                        ),
                        child: SvgPicture.asset(
                          AppImages.favoriteIcon,
                          width: AppValues.width18,
                          height: AppValues.width18,
                          colorFilter: ColorFilter.mode(
                            venue.isFavorite ?? false
                                ? AppColors.success
                                : AppColors.greyText,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            // Content
            Padding(
              padding: EdgeInsets.all(AppValues.padding12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Price Row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          venue.venueName,
                          style: AppTextStyles.robotoSixteenMedium.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: AppValues.width8),
                      // Price
                      if (venue.price != null && venue.price!.isNotEmpty)
                        Text(
                          venue.price!,
                          style: AppTextStyles.robotoFourteen.copyWith(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.right,
                        ),
                    ],
                  ),
                  SizedBox(height: AppValues.height8),
                  // Address
                  if (venue.address != null && venue.address!.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.only(bottom: AppValues.height8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: AppValues.font14,
                            color: AppColors.greyText,
                          ),
                          SizedBox(width: AppValues.width6),
                          Expanded(
                            child: Text(
                              venue.address!,
                              style: AppTextStyles.robotoFourteen.copyWith(
                                color: AppColors.greyText,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  // Bottom row: Sports on left, Distance on right
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Sports
                      if (venue.sports.isNotEmpty)
                        Expanded(
                          child: Text(
                            venue.sports,
                            style: AppTextStyles.robotoTwelve.copyWith(
                              color: AppColors.greyText,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      SizedBox(width: AppValues.width8),
                      // Distance
                      Text(
                        venue.distance,
                        style: AppTextStyles.robotoTwelve.copyWith(
                          color: AppColors.greyText,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppValues.height8),
                  // Rating
                  RatingWidget(
                    rating: venue.rating,
                    reviewCount: venue.reviewCount ?? 175,
                    starSize: AppValues.font14,
                    ratingStyle: AppTextStyles.robotoTwelveMedium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    reviewStyle: AppTextStyles.robotoTwelve.copyWith(
                      color: AppColors.greyText,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
