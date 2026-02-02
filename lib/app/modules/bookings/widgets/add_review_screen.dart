import 'package:fieldify/app/core/utils/app_colors.dart';
import 'package:fieldify/app/core/utils/app_text_styles.dart';
import 'package:fieldify/app/core/utils/app_values.dart';
import 'package:fieldify/app/core/widgets/custom_appbar.dart';
import 'package:fieldify/app/core/widgets/custom_buttons.dart';
import 'package:fieldify/app/modules/bookings/controller/bookings_controller.dart';
import 'package:fieldify/l10n/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/base/base_view.dart';

class AddReviewScreen extends BaseView<BookingsController> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBars.customAppBar(
        context: context,
        title: AppTranslations.writeReview.tr,
        leadingWidth: AppValues.width40,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppValues.padding20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    AppTranslations.whatDoYouThink.tr,
                    style: AppTextStyles.robotoTwentyFourMedium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: AppValues.height12),
                  Text(
                    AppTranslations.pleaseGiveYourRating.tr,
                    style: AppTextStyles.robotoFourteen.copyWith(
                      color: AppColors.greyText,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: AppValues.height24),
                  Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return GestureDetector(
                        onTap: () {
                          controller.selectRating(index + 1);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppValues.width8,
                          ),
                          child: Icon(
                            Icons.star,
                            size: AppValues.font24,
                            color: index < controller.selectedRating.value
                                ? AppColors.warning
                                : Colors.grey[300],
                          ),
                        ),
                      );
                    }),
                  )),
                ],
              ),
            ),
            SizedBox(height: AppValues.height32),
            Text(
              AppTranslations.tellUsAboutYourExperience.tr,
              style: AppTextStyles.robotoFourteenMedium.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: AppValues.height12),
            Container(
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkCard : AppColors.white,
                borderRadius: BorderRadius.circular(AppValues.radius10),
                // border: Border.all(
                //   color: isDark ? AppColors.darkDivider : AppColors.lightDivider,
                // ),
              ),
              child: TextField(
                controller: controller.reviewController,
                maxLines: 5,
                maxLength: 500,
                textAlignVertical: TextAlignVertical.top,
                style: AppTextStyles.robotoFourteen,
                decoration: InputDecoration(
                  hintText: AppTranslations.tellUsAboutYourExperience.tr,
                  hintStyle: AppTextStyles.robotoFourteen.copyWith(
                    color: AppColors.greyText,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(AppValues.padding16),
                  counterStyle: AppTextStyles.robotoTwelve.copyWith(
                    color: AppColors.greyText,
                  ),
                ),
              ),
            ),
            SizedBox(height: AppValues.height32),
            ButtonFactory.primary(
              onPressed: () {
                if (controller.selectedRating.value == 0) {
                  Get.snackbar(
                    'Error',
                    'Please select a rating',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                  return;
                }
                if (controller.reviewController.text.isEmpty) {
                  Get.snackbar(
                    'Error',
                    'Please write a review',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                  return;
                }
                Get.back();
              },
              title: AppTranslations.submit.tr,
            ),
            SizedBox(height: AppValues.height20),
          ],
        ),
      ),
    );
  }
}
