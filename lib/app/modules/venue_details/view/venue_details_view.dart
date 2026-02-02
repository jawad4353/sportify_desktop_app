import 'package:fieldify/app/core/base/base_view.dart';
import 'package:fieldify/app/core/utils/app_colors.dart';
import 'package:fieldify/app/core/utils/app_images.dart';
import 'package:fieldify/app/core/utils/app_text_styles.dart';
import 'package:fieldify/app/core/utils/app_values.dart';
import 'package:fieldify/app/core/widgets/custom_buttons.dart';
import 'package:fieldify/app/core/widgets/horizontal_divider.dart';
import 'package:fieldify/app/core/widgets/rating_widget.dart';
import 'package:fieldify/app/modules/venue_details/controller/venue_details_controller.dart';
import 'package:fieldify/app/modules/venue_details/widgets/amenity_tag.dart';
import 'package:fieldify/app/modules/venue_details/widgets/sport_item_detail.dart';
import 'package:fieldify/app/modules/venue_details/widgets/venue_image_carousel.dart';
import 'package:fieldify/app/modules/venue_details/widgets/venue_reviews_section.dart';
import 'package:fieldify/app/modules/venue_details/widgets/venue_rules_section.dart';
import 'package:fieldify/l10n/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class VenueDetailsView extends BaseView<VenueDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const VenueImageCarousel(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(AppValues.padding16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _venueHeader(context),
                            if (controller.venue.operatingHours != null) ...[
                              SizedBox(height: AppValues.height12),
                              _operatingHours(context),
                            ],
                            if (controller.venue.address != null ||
                                controller.venue.fullAddress != null) ...[
                              SizedBox(height: AppValues.height12),
                              _locationInfo(context),
                            ],
                            if (controller.venue.sportsList != null &&
                                controller.venue.sportsList!.isNotEmpty)
                              _sportsSection(),
                            if (controller.venue.amenities != null &&
                                controller.venue.amenities!.isNotEmpty)
                              _amenitiesSection(),
                            VenueRulesSection(
                              onPressed: controller.onRulesAndRegulationsPressed,
                            ),
                            VenueReviewsSection(
                              reviews: controller.reviews,
                              onViewAllPressed: controller.onViewAllReviewsPressed,
                            ),
                            SizedBox(height: AppValues.height16),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: AppValues.padding20,vertical: AppValues.padding18),
            child: ButtonFactory.primary(
              onPressed: controller.onCheckAvailabilityPressed,
              title: AppTranslations.checkAvailability.tr,
            ),
          )
        ],
      ),
    );
  }

  Widget _venueHeader(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          controller.venue.venueName,
          style: AppTextStyles.robotoTwentyFourMedium.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: AppValues.height8),
        RatingWidget(
          rating: controller.venue.rating,
          reviewCount: controller.venue.reviewCount ?? 175,
          starSize: AppValues.font16,
          ratingStyle: AppTextStyles.robotoFourteenMedium.copyWith(
            fontWeight: FontWeight.bold,
          ),
          reviewStyle: AppTextStyles.robotoFourteen.copyWith(
            color: AppColors.greyText,
          ),
        ),
        if (controller.venue.price != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox.shrink(),
              Text(
                controller.venue.price!,
                style: AppTextStyles.robotoFourteenMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.primaryColor,
                ),
              ),
            ],
          ),
      ],
    );
  }

  Widget _operatingHours(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Row(
      children: [
        Icon(
          Icons.access_time,
          color: theme.primaryColor,
          size: AppValues.font16,
        ),
        SizedBox(width: AppValues.width8),
        Text(
          controller.venue.operatingHours!,
          style: AppTextStyles.robotoFourteen.copyWith(
            color: isDark
                ? AppColors.darkTextPrimary
                : AppColors.lightTextPrimary,
          ),
        ),
      ],
    );
  }

  Widget _locationInfo(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : AppColors.lightCard,
      ),
      child: Column(
        children: [
          const HorizontalDivider(),
          GestureDetector(
            onTap: controller.onLocationPressed,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppValues.padding16,
                vertical: AppValues.padding6,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: theme.primaryColor,
                    size: AppValues.font20,
                  ),
                  SizedBox(width: AppValues.width12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.venue.fullAddress ??
                              controller.venue.address ??
                              '',
                          style: AppTextStyles.robotoFourteen.copyWith(
                            color: isDark
                                ? AppColors.darkTextPrimary
                                : AppColors.lightTextPrimary,
                          ),
                        ),
                        if (controller.venue.fullAddress != null) ...[
                          SizedBox(height: AppValues.height4),
                          Text(
                            AppTranslations.clickToViewOnMap.tr,
                            style: AppTextStyles.robotoTwelve.copyWith(
                              color: AppColors.greyText,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  SvgPicture.asset(
                    AppImages.arrowForwardIcon,
                    width: AppValues.width15,
                    height: AppValues.width15,
                    colorFilter: ColorFilter.mode(
                      AppColors.greyText,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const HorizontalDivider(),
        ],
      ),
    );
  }

  Widget _sportsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppValues.height24),
        Text(
          AppTranslations.sportsAvailable.tr,
          style: AppTextStyles.robotoSixteen.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: AppValues.height12),
        Wrap(
          children: controller.venue.sportsList!
              .map((sport) => SportItemDetail(sportName: sport))
              .toList(),
        ),
      ],
    );
  }

  Widget _amenitiesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppValues.height24),
        Text(
          AppTranslations.amenities.tr,
          style: AppTextStyles.robotoSixteen.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: AppValues.height12),
        Wrap(
          children: controller.venue.amenities!
              .map((amenity) => AmenityTag(amenity: amenity))
              .toList(),
        ),
      ],
    );
  }

}
