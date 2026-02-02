import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_images.dart';
import '../../../core/utils/app_text_styles.dart';
import '../../../core/utils/app_values.dart';
import '../../../core/widgets/language_toggle_widget.dart';
import 'package:fieldify/l10n/app_translations.dart';

class LanguageToggleTile extends StatelessWidget {
  const LanguageToggleTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppValues.margin16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(AppValues.radius8),
      ),
      child: Container(
        height: AppValues.height56,
        padding: EdgeInsets.symmetric(
          horizontal: AppValues.padding16,
        ),
        child: Row(
          children: [
            Container(
              width: AppValues.width40,
              height: AppValues.width40,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppValues.radius8),
              ),
              child: Center(
                child: SvgPicture.asset(
                  AppImages.globeIcon,
                  width: AppValues.width20,
                  height: AppValues.width20,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            SizedBox(width: AppValues.width16),
            Expanded(
              child: Text(
                AppTranslations.languageSettings.tr,
                style: AppTextStyles.robotoSixteen,
              ),
            ),
            const LanguageToggleWidget(),
          ],
        ),
      ),
    );
  }
}
