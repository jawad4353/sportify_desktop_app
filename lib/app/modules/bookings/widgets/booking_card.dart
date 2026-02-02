import 'package:fieldify/app/core/widgets/horizontal_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/enums/booking_status.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_styles.dart';
import '../../../core/utils/app_values.dart';
import '../../../core/widgets/custom_buttons.dart';
import '../../../data/model/booking_model.dart';
import '../../../routes/app_pages.dart';
import '../controller/bookings_controller.dart';

class BookingCard extends StatelessWidget {
  final BookingModel booking;

  const BookingCard({
    Key? key,
    required this.booking,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.only(bottom: AppValues.height16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : AppColors.white,
        borderRadius: BorderRadius.circular(AppValues.radius10),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withOpacity(isDark ? 0.2 : 0.1),
            blurRadius: 8,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(AppValues.padding12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppValues.radius8),
                  child: Image.network(
                    booking.imageUrl,
                    width: AppValues.width100,
                    height: AppValues.width100,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: Icon(
                          Icons.image_not_supported,
                          color: Colors.grey[600],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(width: AppValues.width12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        booking.venueName,
                        style: AppTextStyles.robotoSixteenMedium.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: AppValues.height4),
                      Text(
                        booking.sport,
                        style: AppTextStyles.robotoFourteen.copyWith(
                          color: AppColors.greyText,
                        ),
                      ),
                      SizedBox(height: AppValues.height8),
                      Text(
                        '${booking.date} | ${booking.startTime} - ${booking.endTime}',
                        style: AppTextStyles.robotoFourteenMedium.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: AppValues.height4),
                      Text(
                        '${booking.location} ${booking.distance}',
                        style: AppTextStyles.robotoFourteen.copyWith(
                          color: AppColors.greyText,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const HorizontalDivider(),
          Padding(
            padding: EdgeInsets.all(AppValues.padding12),
            child: Row(
              children: [
                Expanded(
                  child: _buildStatusButton(),
                ),
                SizedBox(width: AppValues.width12),
                Expanded(
                  child: _buildActionButton(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusButton() {
    final controller = Get.find<BookingsController>();
    final statusText = controller.getBookingStatusText(booking.status);

    return PrimaryButton(
      onPressed: () {
        assert(true);
      },
      title: statusText,
    ).build();
  }

  Widget _buildActionButton() {
    final theme = Get.theme;
    final isDark = theme.brightness == Brightness.dark;
    final iconColor = isDark ? AppColors.white : AppColors.primaryBlue;
    final textColor = isDark ? AppColors.white : AppColors.primaryBlue;

    if (booking.status == BookingStatus.completed) {
      return InkWell(
        onTap: () {
          Get.toNamed(Routes.ADD_REVIEW);
        },
        borderRadius: BorderRadius.circular(AppValues.radius8),
        child: Container(
          height: AppValues.height43,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppValues.radius8),
            border: Border.all(
              color: isDark ? AppColors.darkDivider : AppColors.lightDivider,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star_outline,
                color: iconColor,
                size: AppValues.width20,
              ),
              SizedBox(width: AppValues.width8),
              Text(
                'Rate Venue',
                style: AppTextStyles.robotoFourteenMedium.copyWith(
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      );
    } else if (booking.status == BookingStatus.cancelled) {
      return Container(
        height: AppValues.height43,
      );
    } else {
      return InkWell(
        onTap: () {
          assert(true);
        },
        borderRadius: BorderRadius.circular(AppValues.radius8),
        child: Container(
          height: AppValues.height43,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppValues.radius8),
            border: Border.all(
              color: isDark ? AppColors.darkDivider : AppColors.lightDivider,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.share_outlined,
                color: iconColor,
                size: AppValues.width20,
              ),
              SizedBox(width: AppValues.width8),
              Text(
                booking.status == BookingStatus.upcoming
                    ? 'Share'
                    : 'Cancel Booking',
                style: AppTextStyles.robotoFourteenMedium.copyWith(
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
