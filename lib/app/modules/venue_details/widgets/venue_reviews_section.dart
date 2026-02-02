import 'package:flutter/material.dart';
import 'package:fieldify/app/core/utils/app_text_styles.dart';
import 'package:fieldify/app/core/utils/app_values.dart';
import 'package:fieldify/app/modules/venue_details/models/review_model.dart';
import 'package:fieldify/app/modules/venue_details/widgets/review_card.dart';
import 'package:fieldify/app/modules/venue_details/widgets/show_more_reviews_tile.dart';
import 'package:fieldify/l10n/app_translations.dart';
import 'package:get/get.dart';

class VenueReviewsSection extends StatelessWidget {
  final List<ReviewModel> reviews;
  final VoidCallback? onViewAllPressed;

  const VenueReviewsSection({
    Key? key,
    required this.reviews,
    this.onViewAllPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (reviews.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppValues.height24),
        Text(
          AppTranslations.ratingsAndReviews.tr,
          style: AppTextStyles.robotoSixteen.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: AppValues.height16),
        ...reviews.map((review) => ReviewCard(review: review)).toList(),
        if (onViewAllPressed != null)
          ShowMoreReviewsTile(
            onTap: onViewAllPressed,
          ),
      ],
    );
  }
}
