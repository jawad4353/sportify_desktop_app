import 'package:fieldify/app/core/base/base_view.dart';
import 'package:fieldify/app/core/utils/app_images.dart';
import 'package:fieldify/app/core/utils/app_text_styles.dart';
import 'package:fieldify/app/core/utils/app_values.dart';
import 'package:fieldify/app/core/widgets/custom_appbar.dart';
import 'package:fieldify/app/core/widgets/custom_text_fields.dart';
import 'package:fieldify/app/core/widgets/venue_card.dart';
import 'package:fieldify/app/core/shimmer/index.dart';
import 'package:fieldify/app/modules/home/controller/home_controller.dart';
import 'package:fieldify/app/modules/home/widgets/clickable_svg_icon.dart';
import 'package:fieldify/app/modules/home/widgets/home_cards_carousel.dart';
import 'package:fieldify/app/modules/home/widgets/sport_item.dart';
import 'package:fieldify/l10n/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends BaseView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBars.customAppBar(
          context: context,

          leadingWidth: AppValues.screenWidth * 0.6,
          leading: Padding(
            padding: EdgeInsets.only(left: AppValues.padding12),
            child: Obx(() => Text(
              '${controller.greetingText.value}\n${controller.userName.value} !',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.robotoTwentyMedium.copyWith(
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
          title: AppTranslations.empty.tr,
          showTrailing: true,
          trailingWidget: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClickableSvgIcon(
                iconPath: AppImages.favoriteIcon,
                onPress: controller.onFavoritePressed,
              ),
              SizedBox(width: AppValues.width8),
              ClickableSvgIcon(
                iconPath: AppImages.notificationsIcon,
                onPress: controller.onNotificationsPressed,
              ),
            ],
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppValues.height2),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppValues.padding16),
              child: TextFieldFactory.createSearchField(
                controller: controller.searchController,
                hintText: AppTranslations.search.tr,
                onChanged: controller.onSearchChanged,
                onSubmitted: controller.onSearchSubmitted,
              ),
            ),
            SizedBox(height: AppValues.height10),
            Obx(() => controller.isLoading.value
                ? const HomeCardsShimmer()
                : const HomeCardsCarousel()),
            SizedBox(height: AppValues.height10),
            _outdoorVenuesSection(),
            SizedBox(height: AppValues.height10),
            _sportsSection(),
            // SizedBox(height: AppValues.height10),
            _indoorVenuesSection(),
          ],
        ),
      ),
    );
  }

  Widget _outdoorVenuesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppValues.padding16),
          child: Text(
            AppTranslations.outdoorVenues.tr,
            style: AppTextStyles.robotoSixteen.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: AppValues.height10),
        Obx(() => SizedBox(
          height: AppValues.height200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: AppValues.padding16),
            itemCount: controller.isLoading.value ? 3 : controller.outdoorVenues.length,
            itemBuilder: (context, index) {
              if (controller.isLoading.value) {
                return const VenueCardShimmer();
              }
              final venue = controller.outdoorVenues[index];

              return VenueCard(
                venueName: venue.venueName,
                rating: venue.rating,
                distance: venue.distance,
                sports: venue.sports,
                imageUrl: venue.imageUrl,
                onTap: () => controller.onVenueTap(venue),
                venue: venue,
                onFavoriteTap: () => controller.onFavoriteTap(venue),
              );
            },
          ),
        )),
      ],
    );
  }

  Widget _indoorVenuesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppValues.padding16),
          child: Text(
            AppTranslations.indoorVenues.tr,
            style: AppTextStyles.robotoSixteen.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: AppValues.height10),
        Obx(() => SizedBox(
          height: AppValues.height200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: AppValues.padding16),
            itemCount: controller.isLoading.value ? 3 : controller.indoorVenues.length,
            itemBuilder: (context, index) {
              if (controller.isLoading.value) {
                return const VenueCardShimmer();
              }
              final venue = controller.indoorVenues[index];

              return VenueCard(
                venueName: venue.venueName,
                rating: venue.rating,
                distance: venue.distance,
                sports: venue.sports,
                imageUrl: venue.imageUrl,
                onTap: () => controller.onVenueTap(venue),
                venue: venue,
                onFavoriteTap: () => controller.onFavoriteTap(venue),
              );
            },
          ),
        )),
      ],
    );
  }

  Widget _sportsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppValues.padding16),
          child: Text(
            AppTranslations.sports.tr,
            style: AppTextStyles.robotoSixteen.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: AppValues.height10),
        Obx(() => SizedBox(
          height: AppValues.height90,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: AppValues.padding16),
            itemCount: controller.isLoading.value ? 5 : controller.sports.length,
            itemBuilder: (context, index) {
              if (controller.isLoading.value) {
                return const SportsCardShimmer();
              }
              final sport = controller.sports[index];

              return SportItem(
                name: sport.translationKey.tr,
                iconPath: sport.iconPath,
                onTap: () {
                  assert(true);
                },
              );
            },
          ),
        )),
      ],
    );
  }
}
