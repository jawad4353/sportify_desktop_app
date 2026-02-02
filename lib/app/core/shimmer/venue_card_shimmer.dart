import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/app_colors.dart';
import '../utils/app_values.dart';

class VenueCardShimmer extends StatelessWidget {
  const VenueCardShimmer({Key? key}) : super(key: key);

  Widget _buildShimmerBox({
    required double width,
    required double height,
    required bool isDark,
    BorderRadius? borderRadius,
    BoxShape shape = BoxShape.rectangle,
  }) {
    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey[800]! : Colors.grey[300]!,
      highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: shape == BoxShape.rectangle
              ? (borderRadius ?? BorderRadius.circular(4))
              : null,
          shape: shape,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      width: AppValues.width180,
      height: AppValues.width200,
      margin: EdgeInsets.only(
        right: AppValues.width12,
        bottom: AppValues.height4,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppValues.radius5),
        color: isDark ? AppColors.darkCard : AppColors.white,
      ),
      child: Stack(
        children: [
          // Image shimmer - Main visual element
          _buildShimmerBox(
            width: AppValues.width180,
            height: AppValues.width180,
            isDark: isDark,
            borderRadius: BorderRadius.circular(AppValues.radius10),
          ),

          // Favorite Icon Button Shimmer
          Positioned(
            top: AppValues.padding8,
            right: AppValues.padding8,
            child: _buildShimmerBox(
              width: AppValues.width28,
              height: AppValues.width28,
              isDark: isDark,
              shape: BoxShape.circle,
            ),
          ),

          // Bottom info container
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(AppValues.padding12),
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkCard : AppColors.white,
                borderRadius: BorderRadius.circular(AppValues.radius10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title (Venue Name)
                  _buildShimmerBox(
                    width: AppValues.width120,
                    height: AppValues.height16,
                    isDark: isDark,
                    borderRadius: BorderRadius.circular(AppValues.radius4),
                  ),
                  SizedBox(height: AppValues.height8),

                  // Rating, Distance, Price Row
                  Row(
                    children: [
                      // Star icon
                      _buildShimmerBox(
                        width: AppValues.width14,
                        height: AppValues.width14,
                        isDark: isDark,
                        shape: BoxShape.circle,
                      ),
                      SizedBox(width: AppValues.width4),

                      // Rating number
                      _buildShimmerBox(
                        width: AppValues.width24,
                        height: AppValues.height12,
                        isDark: isDark,
                      ),
                      SizedBox(width: AppValues.width4),

                      // Review count
                      _buildShimmerBox(
                        width: AppValues.width30,
                        height: AppValues.height12,
                        isDark: isDark,
                      ),
                      SizedBox(width: AppValues.width8),

                      // Distance
                      _buildShimmerBox(
                        width: AppValues.width30,
                        height: AppValues.height12,
                        isDark: isDark,
                      ),

                      const Spacer(),

                      // Price
                      _buildShimmerBox(
                        width: AppValues.width30,
                        height: AppValues.height12,
                        isDark: isDark,
                      ),
                    ],
                  ),
                  SizedBox(height: AppValues.height6),

                  // Sports text
                  _buildShimmerBox(
                    width: AppValues.width50,
                    height: AppValues.height12,
                    isDark: isDark,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
