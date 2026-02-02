import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/app_colors.dart';
import '../utils/app_values.dart';

class FavoriteCardShimmer extends StatelessWidget {
  const FavoriteCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey[700]! : Colors.grey[300]!,
      highlightColor: isDark ? Colors.grey[600]! : Colors.grey[100]!,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: AppValues.padding16,
          vertical: AppValues.height12,
        ),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkCard : AppColors.lightCard,
          borderRadius: BorderRadius.circular(AppValues.radius10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: AppValues.height180,
              decoration: BoxDecoration(
                color: isDark ? Colors.grey[700] : Colors.grey[300],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppValues.radius10),
                  topRight: Radius.circular(AppValues.radius10),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(AppValues.padding12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: AppValues.width120,
                              height: AppValues.height14,
                              color:
                                  isDark ? Colors.grey[700] : Colors.grey[300],
                            ),
                            SizedBox(height: AppValues.height8),
                            Container(
                              width: AppValues.width100,
                              height: AppValues.height12,
                              color:
                                  isDark ? Colors.grey[700] : Colors.grey[300],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: AppValues.width8),
                      Container(
                        width: AppValues.width60,
                        height: AppValues.height14,
                        color: isDark ? Colors.grey[700] : Colors.grey[300],
                      ),
                    ],
                  ),
                  SizedBox(height: AppValues.height12),
                  Container(
                    width: double.infinity,
                    height: AppValues.height12,
                    color: isDark ? Colors.grey[700] : Colors.grey[300],
                  ),
                  SizedBox(height: AppValues.height12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: AppValues.width100,
                        height: AppValues.height12,
                        color: isDark ? Colors.grey[700] : Colors.grey[300],
                      ),
                      Container(
                        width: AppValues.width80,
                        height: AppValues.height12,
                        color: isDark ? Colors.grey[700] : Colors.grey[300],
                      ),
                    ],
                  ),
                  SizedBox(height: AppValues.height12),
                  Container(
                    width: AppValues.width150,
                    height: AppValues.height12,
                    color: isDark ? Colors.grey[700] : Colors.grey[300],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
