import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_values.dart';
import '../../boarding/widgets/dots_widget.dart';
import '../controller/home_controller.dart';

class HomeCardsCarousel extends StatelessWidget {
  const HomeCardsCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Column(
      children: [
        SizedBox(
          height: AppValues.height100+AppValues.height50,
          child: PageView.builder(
            controller: controller.homeCardsPageController,
            onPageChanged: controller.onHomeCardsPageChanged,
            itemCount: controller.homeCardImages.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: AppValues.padding16),
                child: Container(
                  width: double.infinity,
                  height: AppValues.height100,

                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(AppValues.padding10),
                  ),
                  child: SvgPicture.asset(
                    controller.homeCardImages[index],
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: AppValues.height100,
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: AppValues.height8),
        Obx(() => OnboardingDots(
          currentIndex: controller.homeCardsCurrentPage.value,
          totalDots: controller.homeCardImages.length,
        )),
      ],
    );
  }
}
