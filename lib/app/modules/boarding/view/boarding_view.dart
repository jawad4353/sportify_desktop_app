import 'package:fieldify/app/core/utils/app_colors.dart';
import 'package:fieldify/app/core/utils/app_text_styles.dart';
import 'package:fieldify/app/core/utils/app_values.dart';
import 'package:fieldify/app/core/widgets/auth_leading_section.dart';
import 'package:fieldify/app/core/widgets/custom_appbar.dart';
import 'package:fieldify/app/core/widgets/custom_buttons.dart';
import 'package:fieldify/app/modules/boarding/controller/boarding_controller.dart';
import 'package:fieldify/app/modules/boarding/widgets/dots_widget.dart';
import 'package:fieldify/l10n/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/base/base_view.dart';

class BoardingView extends BaseView<BoardingController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBars.authScreenAppBar(context: context),
        body: Row(
          children: [
            Expanded(
              flex: 45,
              child: const AuthLeadingSection(),
            ),
            Expanded(
              flex: 55,
              child: _rightSection(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rightSection() {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: AppValues.kDesktopMaxOnboardingWidth),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppValues.padding30,
            vertical: AppValues.padding20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Obx(() => _currentPageContent()),
              SizedBox(height: AppValues.height24),
              Obx(() => OnboardingDots(
                currentIndex: controller.currentPage.value,
              )),
              SizedBox(height: AppValues.height15),
              ButtonFactory.primary(
                onPressed: () => controller.navigateToLogin(),
                title: AppTranslations.getStarted.tr,
              ),
              SizedBox(height: AppValues.height20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _currentPageContent() {
    final index = controller.currentPage.value;
    final isDarkMode = Get.theme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '"${controller.listOnboardingTopTitles[index]}"',
          style: AppTextStyles.robotoTwenty.copyWith(
            fontWeight: FontWeight.bold,
            color: isDarkMode ? AppColors.white : AppColors.primaryBlue,
            height: AppValues.textHeight1_2,
          ),
        ),
        SizedBox(height: AppValues.height20),
        Text(
          controller.listOnboardingSubtitles[index],
          style: AppTextStyles.robotoSixteen.copyWith(
            color: isDarkMode ? AppColors.white : AppColors.greyText,
            height: AppValues.textHeight1_5,
          ),
        ),
      ],
    );
  }
}
