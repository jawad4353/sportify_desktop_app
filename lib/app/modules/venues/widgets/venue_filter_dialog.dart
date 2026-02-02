import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fieldify/app/core/enums/filter_enums.dart';
import 'package:fieldify/app/core/utils/app_colors.dart';
import 'package:fieldify/app/core/utils/app_text_styles.dart';
import 'package:fieldify/app/core/utils/app_values.dart';
import 'package:fieldify/app/core/widgets/custom_buttons.dart';
import 'package:fieldify/app/modules/venues/controller/venue_controller.dart';
import 'package:fieldify/l10n/app_translations.dart';

class VenueFilterDialog extends StatelessWidget {
  const VenueFilterDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<VenueController>();
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppValues.radius10),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkCard : AppColors.lightCard,
          borderRadius: BorderRadius.circular(AppValues.radius10),
        ),
        child: Column(
          children: [
            _header(context, isDark),
            Expanded(
              child: Row(
                children: [
                  _leftPanel(controller, theme, isDark),
                  Container(
                    width: 1,
                    color: isDark ? AppColors.darkDivider : AppColors.lightDivider,
                  ),
                  Expanded(
                    child: _rightPanel(controller, theme, isDark),
                  ),
                ],
              ),
            ),
            _bottomButtons(controller, theme, isDark),
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context, bool isDark) {
    return Padding(
      padding: EdgeInsets.all(AppValues.padding16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppTranslations.filter.tr,
            style: AppTextStyles.robotoEighteen.copyWith(
              fontWeight: FontWeight.bold,
              color: isDark
                  ? AppColors.darkTextPrimary
                  : AppColors.lightTextPrimary,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.close,
              color: isDark
                  ? AppColors.darkTextPrimary
                  : AppColors.lightTextPrimary,
            ),
            onPressed: () => Get.back(),
          ),
        ],
      ),
    );
  }

  Widget _leftPanel(
      VenueController controller, ThemeData theme, bool isDark) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
      ),
      child: ListView(
        children: [
          _filterCategoryItem(
            controller,
            AppTranslations.sort,
            FilterCategory.sort,
            theme,
            isDark,
          ),
          _filterCategoryItem(
            controller,
            AppTranslations.sports,
            FilterCategory.sports,
            theme,
            isDark,
          ),
          _filterCategoryItem(
            controller,
            AppTranslations.ratings,
            FilterCategory.ratings,
            theme,
            isDark,
          ),
          _filterCategoryItem(
            controller,
            AppTranslations.priceRange,
            FilterCategory.priceRange,
            theme,
            isDark,
          ),
          _filterCategoryItem(
            controller,
            AppTranslations.nearby,
            FilterCategory.nearby,
            theme,
            isDark,
          ),
        ],
      ),
    );
  }

  Widget _filterCategoryItem(
    VenueController controller,
    String title,
    FilterCategory category,
    ThemeData theme,
    bool isDark,
  ) {
    return Obx(() {
      final isSelected = controller.selectedFilterCategory.value == category;
      
      return GestureDetector(
        onTap: () => controller.selectFilterCategory(category),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppValues.padding12,
            vertical: AppValues.height16,
          ),
          decoration: BoxDecoration(
            color: isSelected
                ? theme.primaryColor
                : Colors.transparent,
          ),
          child: Text(
            title.tr,
            style: AppTextStyles.robotoFourteen.copyWith(
              color: isSelected
                  ? AppColors.white
                  : (isDark
                      ? AppColors.darkTextPrimary
                      : AppColors.lightTextPrimary),
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
      );
    });
  }

  Widget _rightPanel(
      VenueController controller, ThemeData theme, bool isDark) {
    return Obx(() {
      switch (controller.selectedFilterCategory.value) {
        case FilterCategory.sort:
          return _sortOptions(controller, theme, isDark);
        case FilterCategory.sports:
          return _sportsOptions(controller, theme, isDark);
        case FilterCategory.ratings:
          return _ratingsOptions(controller, theme, isDark);
        case FilterCategory.priceRange:
          return _priceRangeOptions(controller, theme, isDark);
        case FilterCategory.nearby:
          return _nearbyOptions(controller, theme, isDark);
      }
    });
  }

  Widget _sortOptions(
      VenueController controller, ThemeData theme, bool isDark) {
    return Padding(
      padding: EdgeInsets.all(AppValues.padding16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _radioOption(
            controller,
            AppTranslations.recommended,
            SortOption.recommended,
            theme,
            isDark,
          ),
          SizedBox(height: AppValues.height16),
          _radioOption(
            controller,
            AppTranslations.ratingHighToLow,
            SortOption.ratingHighToLow,
            theme,
            isDark,
          ),
          SizedBox(height: AppValues.height16),
          _radioOption(
            controller,
            AppTranslations.priceLowToHigh,
            SortOption.priceLowToHigh,
            theme,
            isDark,
          ),
          SizedBox(height: AppValues.height16),
          _radioOption(
            controller,
            AppTranslations.priceHighToLow,
            SortOption.priceHighToLow,
            theme,
            isDark,
          ),
        ],
      ),
    );
  }

  Widget _radioOption(
    VenueController controller,
    String title,
    SortOption option,
    ThemeData theme,
    bool isDark,
  ) {
    return Obx(() => GestureDetector(
          onTap: () => controller.selectSortOption(option),
          child: Row(
            children: [
              Radio<SortOption>(
                value: option,
                groupValue: controller.selectedSortOption.value,
                onChanged: (value) => controller.selectSortOption(value!),
                activeColor: theme.primaryColor,
              ),
              SizedBox(width: AppValues.width8),
              Expanded(
                child: Text(
                  title.tr,
                  style: AppTextStyles.robotoFourteen.copyWith(
                    color: controller.selectedSortOption.value == option
                        ? (isDark
                            ? AppColors.darkTextPrimary
                            : AppColors.lightTextPrimary)
                        : AppColors.greyText,
                    fontWeight: controller.selectedSortOption.value == option
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _sportsOptions(
      VenueController controller, ThemeData theme, bool isDark) {
    return Padding(
      padding: EdgeInsets.all(AppValues.padding16),
      child: Text(
        AppTranslations.comingSoon.tr,
        style: AppTextStyles.robotoFourteen.copyWith(
          color: AppColors.greyText,
        ),
      ),
    );
  }

  Widget _ratingsOptions(
      VenueController controller, ThemeData theme, bool isDark) {
    return Padding(
      padding: EdgeInsets.all(AppValues.padding16),
      child: Text(
        AppTranslations.comingSoon.tr,
        style: AppTextStyles.robotoFourteen.copyWith(
          color: AppColors.greyText,
        ),
      ),
    );
  }

  Widget _priceRangeOptions(
      VenueController controller, ThemeData theme, bool isDark) {
    return Padding(
      padding: EdgeInsets.all(AppValues.padding16),
      child: Text(
        AppTranslations.comingSoon.tr,
        style: AppTextStyles.robotoFourteen.copyWith(
          color: AppColors.greyText,
        ),
      ),
    );
  }

  Widget _nearbyOptions(
      VenueController controller, ThemeData theme, bool isDark) {
    return Padding(
      padding: EdgeInsets.all(AppValues.padding16),
      child: Text(
        AppTranslations.comingSoon.tr,
        style: AppTextStyles.robotoFourteen.copyWith(
          color: AppColors.greyText,
        ),
      ),
    );
  }

  Widget _bottomButtons(
      VenueController controller, ThemeData theme, bool isDark) {
    return Container(
      padding: EdgeInsets.all(AppValues.padding16),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: isDark ? AppColors.darkDivider : AppColors.lightDivider,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () => controller.resetFilters(),
              child: Text(
                AppTranslations.reset.tr,
                style: AppTextStyles.robotoFourteenMedium.copyWith(
                  color: theme.primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(width: AppValues.width16),
          Expanded(
            child: ButtonFactory.primary(
              onPressed: () {
                controller.applyFilters();
                Get.back();
              },
              title: AppTranslations.apply.tr,
            ),
          ),
        ],
      ),
    );
  }
}
