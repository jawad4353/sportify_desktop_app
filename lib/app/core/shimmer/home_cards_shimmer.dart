import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/app_colors.dart';
import '../utils/app_values.dart';

class HomeCardsShimmer extends StatelessWidget {
  const HomeCardsShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey[700]! : Colors.grey[300]!,
      highlightColor: isDark ? Colors.grey[600]! : Colors.grey[100]!,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppValues.padding16),
        child: Container(
          width: double.infinity,
          height: AppValues.height180,
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkCard : Colors.grey[300],
            borderRadius: BorderRadius.circular(AppValues.padding14),
          ),
        ),
      ),
    );
  }
}
