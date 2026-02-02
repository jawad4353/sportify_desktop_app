import 'package:fieldify/app/core/base/base_view.dart';
import 'package:fieldify/app/core/shimmer/venue_card_shimmer.dart';
import 'package:fieldify/app/core/utils/app_values.dart';
import 'package:fieldify/app/core/widgets/custom_appbar.dart';
import 'package:fieldify/app/core/widgets/custom_text_fields.dart';
import 'package:fieldify/app/core/widgets/filter_icon_button.dart';
import 'package:fieldify/app/core/widgets/venue_card.dart';
import 'package:fieldify/app/modules/venues/controller/venue_controller.dart';
import 'package:fieldify/l10n/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VenueView extends BaseView<VenueController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBars.authScreenAppBar(context: context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppValues.height20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppValues.padding16),
            child: Row(
              children: [
                Expanded(
                  child: TextFieldFactory.createSearchField(
                    controller: controller.searchController,
                    hintText: AppTranslations.search.tr,
                    onChanged: (value) {
                      assert(true);
                    },
                    onSubmitted: (value) {
                      assert(true);
                    },
                  ),
                ),
                SizedBox(width: AppValues.width12),
                FilterIconButton(
                  onTap: controller.showFilterDialog,
                ),
              ],
            ),
          ),
          SizedBox(height: AppValues.height20),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppValues.padding16),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: AppValues.width5,
                      mainAxisSpacing: AppValues.height16,
                      childAspectRatio: 0.65,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return const VenueCardShimmer();
                    },
                  ),
                );
              }
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: AppValues.padding16),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: AppValues.width5,
                    mainAxisSpacing: AppValues.height16,
                    childAspectRatio: 0.65,
                  ),
                  itemCount: controller.venues.length,
                  itemBuilder: (context, index) {
                    final venue = controller.venues[index];

                    return VenueCard(
                      venueName: venue.venueName,
                      rating: venue.rating,
                      distance: venue.distance,
                      sports: venue.sports,
                      imageUrl: venue.imageUrl,
                      onTap: () => controller.onVenueTap(venue),
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
