import 'package:fieldify/app/core/base/base_view.dart';
import 'package:fieldify/app/core/utils/app_colors.dart';
import 'package:fieldify/app/core/utils/app_values.dart';
import 'package:fieldify/app/core/widgets/custom_appbar.dart';
import 'package:fieldify/app/modules/favorites/controller/favorites_controller.dart';
import 'package:fieldify/l10n/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/empty_favorites_widget.dart';
import '../widgets/favorite_card.dart';

class FavoritesView extends BaseView<FavoritesController> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: isDarkMode ? AppColors.darkBackground : AppColors.white,
      appBar: AppBars.customAppBar(
        context: context,
        leadingWidth: AppValues.width50,
        additionalHeight: 0,
        title: AppTranslations.favorites.tr,
      ),
      body: Obx(
        () => controller.favorites.isEmpty
            ? const EmptyFavoritesWidget()
            : ListView.builder(
                padding: EdgeInsets.all(AppValues.padding8),
                itemCount: controller.favorites.length,
                itemBuilder: (context, index) {
                  final venue = controller.favorites[index];

                  return FavoriteCard(
                    venue: venue,
                    onTap: () => controller.onVenueTap(venue),
                    onFavoriteTap: () => controller.toggleFavorite(venue),
                  );
                },
              ),
      ),
    );
  }
}
