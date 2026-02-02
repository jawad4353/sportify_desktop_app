import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_values.dart';

class OnboardingDots extends StatelessWidget {
  final int currentIndex;
  final int totalDots;

  const OnboardingDots({
    super.key,
    required this.currentIndex,
    this.totalDots = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalDots,
        (index) => Container(
          margin: EdgeInsets.symmetric(
            horizontal: AppValues.margin4,
          ),
          width: currentIndex == index ? AppValues.width20 : AppValues.width8,
          height: AppValues.height8,
          decoration: BoxDecoration(
            color: currentIndex == index
                ? AppColors.primaryBlue
                : AppColors.primaryBlue.withOpacity(AppValues.opacity03),
            borderRadius: BorderRadius.circular(
              AppValues.radius4,
            ),
          ),
        ),
      ),
    );
  }
}
