import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fieldify/app/core/utils/app_colors.dart';
import 'package:fieldify/app/core/utils/app_values.dart';
import 'package:fieldify/app/core/widgets/asset_image_view.dart';
import 'package:fieldify/app/modules/venue_details/controller/venue_details_controller.dart';
import 'package:fieldify/app/modules/venue_details/widgets/button_image_icon.dart';

import '../../../core/base/base_view.dart';

class VenueImageCarousel extends BaseView<VenueDetailsController> {
  const VenueImageCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Obx(() {
      final images = controller.imageList;
      final currentIndex = controller.currentImageIndex.value;

      return SizedBox(
        height: AppValues.height200 + MediaQuery.of(context).padding.top,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned.fill(
              child: PageView.builder(
              itemCount: images.length,
              onPageChanged: controller.onImageChanged,
              itemBuilder: (context, index) {
                String imagePath = images[index];

                  return Image.network(
                    imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: Icon(
                          Icons.image_not_supported,
                          size: AppValues.font24,
                          color: Colors.grey[600],
                        ),
                      );
                    },
                  );

              },
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + AppValues.height12,
              left: AppValues.width16,
              child: ButtonImageIcon(
                icon: Icons.arrow_back,
                onTap: controller.onBackPressed,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + AppValues.height12,
              right: AppValues.width60,
              child: Obx(() => ButtonImageIcon(
                    icon: controller.isFavorite.value
                        ? Icons.favorite
                        : Icons.favorite_border,
                    onTap: controller.onFavoritePressed,
                    iconColor: controller.isFavorite.value
                        ? AppColors.error
                        : AppColors.white,
                  )),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + AppValues.height12,
              right: AppValues.width16,
              child: ButtonImageIcon(
                icon: Icons.share,
                onTap: controller.onSharePressed,
              ),
            ),
            Positioned(
              bottom: AppValues.height16,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                images.length,
                (index) => Container(
                  width: index == currentIndex
                      ? AppValues.width8
                      : AppValues.width6,
                  height: AppValues.width6,
                  margin: EdgeInsets.symmetric(horizontal: AppValues.width4),
                  decoration: BoxDecoration(
                    color: index == currentIndex
                        ? AppColors.white
                        : AppColors.white.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              ),
            ),
            Positioned(
              bottom: AppValues.height16,
              right: AppValues.width16,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppValues.width8,
                  vertical: AppValues.height4,
                ),
                decoration: BoxDecoration(
                  color: isDark ? Colors.black54 : Colors.black26,
                  borderRadius: BorderRadius.circular(AppValues.radius10),
                ),
                child: Text(
                  '${currentIndex + 1}/${images.length}',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: AppValues.font12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
