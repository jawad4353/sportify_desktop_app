import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_text_styles.dart';
import '../utils/app_values.dart';
import '../../../l10n/app_translations.dart';

class RatingWidget extends StatelessWidget {
  final String rating;
  final int reviewCount;
  final double starSize;
  final TextStyle? ratingStyle;
  final TextStyle? reviewStyle;

  const RatingWidget({
    Key? key,
    required this.rating,
    this.reviewCount = 0,
    this.starSize = 16.0,
    this.ratingStyle,
    this.reviewStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
        AppImages.starIcon,
          color: AppColors.success,
          height: AppValues.height16,
        ),
        SizedBox(width: AppValues.width4),
        Text(
          rating,
          style: ratingStyle ??
              AppTextStyles.robotoFourteenMedium.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(width: AppValues.width4),
        Text(
          '($reviewCount)',
          style: reviewStyle ??
              AppTextStyles.robotoFourteen.copyWith(
                color: AppColors.greyText,
              ),
        ),
      ],
    );
  }
}
