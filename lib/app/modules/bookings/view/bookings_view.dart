import 'package:fieldify/app/core/base/base_view.dart';
import 'package:fieldify/app/core/shimmer/booking_card_shimmer.dart';
import 'package:fieldify/app/core/utils/app_values.dart';
import 'package:fieldify/app/core/widgets/custom_appbar.dart';
import 'package:fieldify/app/core/widgets/custom_text_fields.dart';
import 'package:fieldify/app/core/widgets/filter_icon_button.dart';
import 'package:fieldify/app/modules/bookings/controller/bookings_controller.dart';
import 'package:fieldify/app/modules/bookings/widgets/booking_card.dart';
import 'package:fieldify/l10n/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingsView extends BaseView<BookingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBars.authScreenAppBar(context: context,),
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
            child: _displayBookings(),
          ),
        ],
      ),
    );
  }

  Widget _displayBookings() {
    return Obx(() {
      if (controller.isLoading.value) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: AppValues.padding16),
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return const BookingCardShimmer();
            },
          ),
        );
      }
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: AppValues.padding16),
        child: ListView.builder(
          itemCount: controller.bookings.length,
          itemBuilder: (context, index) {
            return BookingCard(
              booking: controller.bookings[index],
            );
          },
        ),
      );
    });
  }
}
