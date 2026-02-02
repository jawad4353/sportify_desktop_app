import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fieldify/app/core/utils/app_colors.dart';
import 'package:fieldify/app/core/utils/app_images.dart';
import 'package:fieldify/app/core/utils/app_text_styles.dart';
import 'package:fieldify/app/core/utils/app_values.dart';
import 'package:fieldify/app/core/widgets/horizontal_divider.dart';
import 'package:fieldify/l10n/app_translations.dart';
import 'package:get/get.dart';

class VenueRulesSection extends StatelessWidget {
  final VoidCallback? onPressed;

  const VenueRulesSection({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppValues.height24),
        const HorizontalDivider(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppValues.height16),
          child: GestureDetector(
            onTap: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppTranslations.rulesAndRegulations.tr,
                  style: AppTextStyles.robotoSixteen.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SvgPicture.asset(
                  AppImages.arrowForwardIcon,
                  width: AppValues.width15,
                  height: AppValues.width15,
                  colorFilter: ColorFilter.mode(
                    AppColors.greyText,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
        ),
        const HorizontalDivider(),
      ],
    );
  }
}
