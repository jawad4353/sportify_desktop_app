import 'package:flutter/material.dart';
import 'package:fieldify/app/core/utils/app_colors.dart';
import 'package:fieldify/app/core/utils/app_text_styles.dart';
import 'package:fieldify/app/core/utils/app_values.dart';
import 'package:fieldify/app/core/widgets/rating_widget.dart';
import 'package:fieldify/app/modules/venue_details/models/review_model.dart';

class ReviewCard extends StatelessWidget {
  final ReviewModel review;

  const ReviewCard({
    Key? key,
    required this.review,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.only(bottom: AppValues.height16),
      padding: EdgeInsets.all(AppValues.padding16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : AppColors.lightCard,
        borderRadius: BorderRadius.circular(AppValues.radius10),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withOpacity(isDark ? 0.3 : 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              RatingWidget(
                rating: review.rating.toStringAsFixed(1),
                reviewCount: 0,
                starSize: AppValues.font16,
                ratingStyle: AppTextStyles.robotoFourteenMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                reviewStyle: AppTextStyles.robotoFourteenMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: AppValues.height12),
          Text(
            review.comment,
            style: AppTextStyles.robotoFourteen.copyWith(
              color: isDark
                  ? AppColors.darkTextPrimary
                  : AppColors.lightTextPrimary,
            ),
          ),
          SizedBox(height: AppValues.height12),
          Row(
            children: [
              CircleAvatar(
                radius: AppValues.width16,
                backgroundColor: theme.primaryColor.withOpacity(0.1),
                child: Text(
                  review.userName.isNotEmpty
                      ? review.userName[0].toUpperCase()
                      : 'U',
                  style: AppTextStyles.robotoFourteenMedium.copyWith(
                    color: theme.primaryColor,
                  ),
                ),
              ),
              SizedBox(width: AppValues.width8),
              Text(
                review.userName,
                style: AppTextStyles.robotoFourteen.copyWith(
                  color: isDark
                      ? AppColors.darkTextPrimary
                      : AppColors.lightTextPrimary,
                ),
              ),
              const Spacer(),
              Text(
                review.timeAgo,
                style: AppTextStyles.robotoTwelve.copyWith(
                  color: AppColors.greyText,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
