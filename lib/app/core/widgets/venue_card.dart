import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/model/venue_model.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_text_styles.dart';
import '../utils/app_values.dart';
import 'rating_widget.dart';

class VenueCard extends StatelessWidget {
  final String? venueName;
  final String? rating;
  final String? distance;
  final String? sports;
  final String? imageUrl;
  final String? price;
  final VoidCallback? onTap;
  final VenueModel? venue;
  final VoidCallback? onFavoriteTap;

  const VenueCard({
    Key? key,
    this.venueName,
    this.rating,
    this.distance,
    this.sports,
    this.imageUrl,
    this.price,
    this.onTap,
    this.venue,
    this.onFavoriteTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final name = venue?.venueName ?? venueName ?? 'Venue Name';
    final rate = venue?.rating ?? rating ?? '4.0';
    final dist = venue?.distance ?? distance ?? '~1.8 km';
    final sportsText = venue?.sports ?? sports;
    final img = venue?.imageUrl ?? imageUrl;
    final priceText = venue?.price ?? price;
    final isFav = venue?.isFavorite ?? false;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppValues.width180,
        height: AppValues.width200,
        margin: EdgeInsets.only(
            right: AppValues.width12, bottom: AppValues.height4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppValues.radius5),
          boxShadow: [
            BoxShadow(
              color: theme.shadowColor.withOpacity(isDark ? 0.3 : 0.1),
              blurRadius: 8,
              spreadRadius: 0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Container(
              width: AppValues.width180,
              height: AppValues.width180,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(AppValues.radius10),
              ),
              child: Image.network(
                img ??
                    'https://fun-orange-xogqsdtvup.edgeone.app/Venue-image.png',
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: Icon(
                      Icons.image_not_supported,
                      size: AppValues.font24,
                      color: Colors.grey[600],
                    ),
                  );
                },
              ),
            ),
            // Favorite Icon
            if (onFavoriteTap != null)
              Positioned(
                top: AppValues.padding8,
                right: AppValues.padding8,
                child: GestureDetector(
                  onTap: onFavoriteTap,
                  child: Container(
                    padding: EdgeInsets.all(AppValues.padding6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.9),
                    ),
                    child: SvgPicture.asset(
                      AppImages.favoriteIcon,
                      width: AppValues.width16,
                      height: AppValues.width16,
                      colorFilter: ColorFilter.mode(
                        isFav ? AppColors.success : AppColors.greyText,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(AppValues.padding12),
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(AppValues.radius10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      name,
                      style: AppTextStyles.robotoSixteenMedium.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: AppValues.height2),
                    Row(
                      children: [
                        Expanded(
                          child: RatingWidget(
                            rating: rate,
                            reviewCount: 175,
                            starSize: AppValues.font14,
                            ratingStyle:
                                AppTextStyles.robotoTwelveMedium.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            reviewStyle: AppTextStyles.robotoTwelve.copyWith(
                              color: AppColors.greyText,
                            ),
                          ),
                        ),
                        SizedBox(width: AppValues.width8),
                        Text(
                          dist,
                          style: AppTextStyles.robotoTwelve.copyWith(
                            color: AppColors.greyText,
                          ),
                        ),
                        SizedBox(width: AppValues.width8),
                      ],
                    ),
                    if (sportsText != null && sportsText.isNotEmpty) ...[
                      SizedBox(height: AppValues.height2),
                      Text(
                        sportsText,
                        style: AppTextStyles.robotoTwelve.copyWith(
                          color: AppColors.greyText,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        priceText ?? '1100/PKR',
                        style: AppTextStyles.robotoTwelveMedium.copyWith(
                          color: theme.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
