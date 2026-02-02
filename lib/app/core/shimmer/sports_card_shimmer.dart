import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/app_colors.dart';
import '../utils/app_values.dart';

class SportsCardShimmer extends StatelessWidget {
  const SportsCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey[700]! : Colors.grey[300]!,
      highlightColor: isDark ? Colors.grey[600]! : Colors.grey[100]!,
      child: Container(
        width: AppValues.width80,
        margin: EdgeInsets.only(right: AppValues.width16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon shimmer
            Container(
              width: AppValues.width30,
              height: AppValues.width30,
              decoration: BoxDecoration(
                color: isDark ? Colors.grey[700] : Colors.grey[300],
                borderRadius: BorderRadius.circular(AppValues.radius4),
              ),
            ),
            SizedBox(height: AppValues.height8),
            // Text shimmer
            Container(
              width: AppValues.width60,
              height: AppValues.height12,
              decoration: BoxDecoration(
                color: isDark ? Colors.grey[700] : Colors.grey[300],
                borderRadius: BorderRadius.circular(AppValues.radius4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
