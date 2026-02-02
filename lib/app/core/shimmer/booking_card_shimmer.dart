import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/app_colors.dart';
import '../utils/app_values.dart';

class BookingCardShimmer extends StatelessWidget {
  const BookingCardShimmer({Key? key}) : super(key: key);

  Widget _buildShimmerBox({
    required double height,
    required bool isDark,
    double? width,
    BorderRadius? borderRadius,
  }) {
    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey[800]! : Colors.grey[300]!,
      highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius ?? BorderRadius.circular(4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.only(bottom: AppValues.height16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : AppColors.white,
        borderRadius: BorderRadius.circular(AppValues.radius10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(AppValues.padding12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Venue image shimmer
                _buildShimmerBox(
                  width: AppValues.width100,
                  height: AppValues.width100,
                  isDark: isDark,
                  borderRadius: BorderRadius.circular(AppValues.radius8),
                ),
                SizedBox(width: AppValues.width12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Venue name
                      _buildShimmerBox(
                        width: double.infinity,
                        height: AppValues.height16,
                        isDark: isDark,
                        borderRadius: BorderRadius.circular(AppValues.radius4),
                      ),
                      SizedBox(height: AppValues.height4),
                      // Sport
                      _buildShimmerBox(
                        width: AppValues.width80,
                        height: AppValues.height14,
                        isDark: isDark,
                        borderRadius: BorderRadius.circular(AppValues.radius4),
                      ),
                      SizedBox(height: AppValues.height8),
                      // Date and time
                      _buildShimmerBox(
                        width: double.infinity,
                        height: AppValues.height14,
                        isDark: isDark,
                        borderRadius: BorderRadius.circular(AppValues.radius4),
                      ),
                      SizedBox(height: AppValues.height4),
                      // Location and distance
                      _buildShimmerBox(
                        width: AppValues.width150,
                        height: AppValues.height14,
                        isDark: isDark,
                        borderRadius: BorderRadius.circular(AppValues.radius4),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Horizontal divider
          Shimmer.fromColors(
            baseColor: isDark ? Colors.grey[800]! : Colors.grey[300]!,
            highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
            child: Container(
              height: 1,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(AppValues.padding12),
            child: Row(
              children: [
                // First button shimmer
                Expanded(
                  child: _buildShimmerBox(
                    height: AppValues.height43,
                    isDark: isDark,
                    borderRadius: BorderRadius.circular(AppValues.radius8),
                  ),
                ),
                SizedBox(width: AppValues.width12),
                // Second button shimmer
                Expanded(
                  child: _buildShimmerBox(
                    height: AppValues.height43,
                    isDark: isDark,
                    borderRadius: BorderRadius.circular(AppValues.radius8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
