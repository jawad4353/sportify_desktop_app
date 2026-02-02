import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_styles.dart';
import '../../../core/utils/app_values.dart';
import '../../../core/widgets/custom_appbar.dart';
import 'package:fieldify/l10n/app_translations.dart';
import 'package:get/get.dart';

class RulesAndRegulationsScreen extends StatelessWidget {
  const RulesAndRegulationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: isDarkMode ? AppColors.darkBackground : AppColors.white,
      appBar: AppBars.customAppBar(
        context: context,
        title: AppTranslations.rulesAndRegulations.tr,
        leadingWidth: AppValues.width50,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppValues.padding16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _policyTile(
              context: context,
              title: AppTranslations.refundPolicy.tr,
              subtitle: AppTranslations.refundPolicyDesc.tr,
              isDarkMode: isDarkMode,
            ),
            SizedBox(height: AppValues.height16),
            _policyTile(
              context: context,
              title: AppTranslations.cancellationPolicy.tr,
              subtitle: AppTranslations.cancellationPolicyDesc.tr,
              isDarkMode: isDarkMode,
            ),
            SizedBox(height: AppValues.height16),
            _policyTile(
              context: context,
              title: AppTranslations.bookingBehavior.tr,
              subtitle: AppTranslations.bookingBehaviorDesc.tr,
              isDarkMode: isDarkMode,
            ),
            SizedBox(height: AppValues.height16),
            _policyTile(
              context: context,
              title: AppTranslations.paymentPolicy.tr,
              subtitle: AppTranslations.paymentPolicyDesc.tr,
              isDarkMode: isDarkMode,
            ),
            SizedBox(height: AppValues.height16),
            _policyTile(
              context: context,
              title: AppTranslations.safetyPolicy.tr,
              subtitle: AppTranslations.safetyPolicyDesc.tr,
              isDarkMode: isDarkMode,
            ),
            SizedBox(height: AppValues.height16),
            _policyTile(
              context: context,
              title: AppTranslations.damagePolicy.tr,
              subtitle: AppTranslations.damagePolicyDesc.tr,
              isDarkMode: isDarkMode,
            ),
            SizedBox(height: AppValues.height16),
            _policyTile(
              context: context,
              title: AppTranslations.noShowPolicy.tr,
              subtitle: AppTranslations.noShowPolicyDesc.tr,
              isDarkMode: isDarkMode,
            ),
            SizedBox(height: AppValues.height16),
            _policyTile(
              context: context,
              title: AppTranslations.equipmentPolicy.tr,
              subtitle: AppTranslations.equipmentPolicyDesc.tr,
              isDarkMode: isDarkMode,
            ),
            SizedBox(height: AppValues.height16),
            _policyTile(
              context: context,
              title: AppTranslations.agePolicy.tr,
              subtitle: AppTranslations.agePolicyDesc.tr,
              isDarkMode: isDarkMode,
            ),
            SizedBox(height: AppValues.height16),
            _policyTile(
              context: context,
              title: AppTranslations.liabilityPolicy.tr,
              subtitle: AppTranslations.liabilityPolicyDesc.tr,
              isDarkMode: isDarkMode,
            ),
            SizedBox(height: AppValues.height24),
          ],
        ),
      ),
    );
  }

  Widget _policyTile({
    required BuildContext context,
    required String title,
    required String subtitle,
    required bool isDarkMode,
  }) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.all(AppValues.padding16),
      decoration: BoxDecoration(
        color: isDarkMode ? AppColors.darkCard : AppColors.lightCard,
        borderRadius: BorderRadius.circular(AppValues.radius10),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withOpacity(isDarkMode ? 0.3 : 0.1),
            blurRadius: 8,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.robotoSixteenMedium.copyWith(
              fontWeight: FontWeight.w600,
              color: isDarkMode ? AppColors.white : AppColors.primaryBlueDark,
            ),
          ),
          SizedBox(height: AppValues.height8),
          Text(
            subtitle,
            style: AppTextStyles.robotoFourteen.copyWith(
              color: AppColors.greyText,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
