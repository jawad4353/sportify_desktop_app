import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fieldify/app/core/enums/filter_enums.dart';
import 'package:fieldify/app/core/utils/app_colors.dart';
import 'package:fieldify/app/core/utils/app_text_styles.dart';
import 'package:fieldify/app/core/utils/app_values.dart';
import 'package:fieldify/app/core/widgets/custom_buttons.dart';
import 'package:fieldify/app/modules/bookings/controller/bookings_controller.dart';
import 'package:fieldify/l10n/app_translations.dart';

class BookingFilterDialog extends StatelessWidget {
  const BookingFilterDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BookingsController>();
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
      BookingsController controller, ThemeData theme, bool isDark) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
      ),
      child: ListView(
        children: [
          _filterCategoryItem(
            controller,
            AppTranslations.status,
            BookingFilterCategory.status,
            theme,
            isDark,
          ),
          _filterCategoryItem(
            controller,
            AppTranslations.name,
            BookingFilterCategory.name,
            theme,
            isDark,
          ),
          _filterCategoryItem(
            controller,
            AppTranslations.date,
            BookingFilterCategory.date,
            theme,
            isDark,
          ),
        ],
      ),
    );
  }

  Widget _filterCategoryItem(
    BookingsController controller,
    String title,
    BookingFilterCategory category,
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
      BookingsController controller, ThemeData theme, bool isDark) {
    return Obx(() {
      switch (controller.selectedFilterCategory.value) {
        case BookingFilterCategory.status:
          return _statusOptions(controller, theme, isDark);
        case BookingFilterCategory.name:
          return _nameOptions(controller, theme, isDark);
        case BookingFilterCategory.date:
          return _dateOptions(controller, theme, isDark);
      }
    });
  }

  Widget _statusOptions(
      BookingsController controller, ThemeData theme, bool isDark) {
    return Padding(
      padding: EdgeInsets.all(AppValues.padding16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _radioOption(
            controller,
            AppTranslations.all,
            BookingStatusFilter.all,
            theme,
            isDark,
          ),
          SizedBox(height: AppValues.height16),
          _radioOption(
            controller,
            AppTranslations.upcoming,
            BookingStatusFilter.upcoming,
            theme,
            isDark,
          ),
          SizedBox(height: AppValues.height16),
          _radioOption(
            controller,
            AppTranslations.completed,
            BookingStatusFilter.completed,
            theme,
            isDark,
          ),
          SizedBox(height: AppValues.height16),
          _radioOption(
            controller,
            AppTranslations.cancelled,
            BookingStatusFilter.cancelled,
            theme,
            isDark,
          ),
          SizedBox(height: AppValues.height16),
          _radioOption(
            controller,
            AppTranslations.pending,
            BookingStatusFilter.pending,
            theme,
            isDark,
          ),
        ],
      ),
    );
  }

  Widget _radioOption(
    BookingsController controller,
    String title,
    BookingStatusFilter option,
    ThemeData theme,
    bool isDark,
  ) {
    return Obx(() => GestureDetector(
          onTap: () => controller.selectStatusFilter(option),
          child: Row(
            children: [
              Radio<BookingStatusFilter>(
                value: option,
                groupValue: controller.selectedStatusFilter.value,
                onChanged: (value) => controller.selectStatusFilter(value!),
                activeColor: theme.primaryColor,
              ),
              SizedBox(width: AppValues.width8),
              Expanded(
                child: Text(
                  title.tr,
                  style: AppTextStyles.robotoFourteen.copyWith(
                    color: controller.selectedStatusFilter.value == option
                        ? (isDark
                            ? AppColors.darkTextPrimary
                            : AppColors.lightTextPrimary)
                        : AppColors.greyText,
                    fontWeight: controller.selectedStatusFilter.value == option
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _nameOptions(
      BookingsController controller, ThemeData theme, bool isDark) {
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

  Widget _dateOptions(
      BookingsController controller, ThemeData theme, bool isDark) {
    return Padding(
      padding: EdgeInsets.all(AppValues.padding16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _dateRadioOption(
            controller,
            AppTranslations.all,
            BookingDateFilter.all,
            theme,
            isDark,
          ),
          SizedBox(height: AppValues.height16),
          _dateRadioOption(
            controller,
            AppTranslations.today,
            BookingDateFilter.today,
            theme,
            isDark,
          ),
          SizedBox(height: AppValues.height16),
          _dateRadioOption(
            controller,
            AppTranslations.thisWeek,
            BookingDateFilter.thisWeek,
            theme,
            isDark,
          ),
          SizedBox(height: AppValues.height16),
          _dateRadioOption(
            controller,
            AppTranslations.thisMonth,
            BookingDateFilter.thisMonth,
            theme,
            isDark,
          ),
          SizedBox(height: AppValues.height16),
          _dateRadioOption(
            controller,
            AppTranslations.custom,
            BookingDateFilter.custom,
            theme,
            isDark,
          ),
        ],
      ),
    );
  }

  Widget _dateRadioOption(
    BookingsController controller,
    String title,
    BookingDateFilter option,
    ThemeData theme,
    bool isDark,
  ) {
    return Obx(() => GestureDetector(
          onTap: () => controller.selectDateFilter(option),
          child: Row(
            children: [
              Radio<BookingDateFilter>(
                value: option,
                groupValue: controller.selectedDateFilter.value,
                onChanged: (value) => controller.selectDateFilter(value!),
                activeColor: theme.primaryColor,
              ),
              SizedBox(width: AppValues.width8),
              Expanded(
                child: Text(
                  title.tr,
                  style: AppTextStyles.robotoFourteen.copyWith(
                    color: controller.selectedDateFilter.value == option
                        ? (isDark
                            ? AppColors.darkTextPrimary
                            : AppColors.lightTextPrimary)
                        : AppColors.greyText,
                    fontWeight: controller.selectedDateFilter.value == option
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _bottomButtons(
      BookingsController controller, ThemeData theme, bool isDark) {
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
