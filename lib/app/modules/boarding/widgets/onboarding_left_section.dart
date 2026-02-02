import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_values.dart';
import '../../../core/widgets/leading_section_clipper.dart';

class OnboardingLeftSection extends StatelessWidget {
  final PageController pageController;
  final List<String> listOnboardingImages;
  final ValueChanged<int> onPageChanged;

  const OnboardingLeftSection({
    super.key,
    required this.pageController,
    required this.listOnboardingImages,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: LeadingSectionCurvedClipper(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: constraints.maxWidth,
            color: AppColors.primary,
            child: Stack(
              children: [
                _buildShapes(),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppValues.padding30,
                      vertical: AppValues.padding20,
                    ),
                    child: Center(
                      child: PageView.builder(
                        controller: pageController,
                        itemCount: listOnboardingImages.length,
                        onPageChanged: onPageChanged,
                        itemBuilder: (context, index) {
                          return SvgPicture.asset(
                            listOnboardingImages[index],
                            height: AppValues.screenHeight40.clamp(
                              AppValues.height200,
                              AppValues.height400,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
          ),
        );
        },
      ),
    );
  }

  Widget _buildShapes() {
    return Stack(
      children: [
        Positioned(
          top: AppValues.screenHeight10,
          right: -AppValues.width40,
          child: _CircleShape(radius: AppValues.height100, opacity: AppValues.opacity01),
        ),
        Positioned(
          top: AppValues.screenHeight40,
          left: -AppValues.width50,
          child: _CircleShape(radius: AppValues.height50, opacity: AppValues.opacity01),
        ),
        Positioned(
          bottom: AppValues.screenHeight15,
          right: AppValues.margin20,
          child: _CircleShape(radius: AppValues.height40, opacity: AppValues.opacity01),
        ),
        Positioned(
          bottom: AppValues.screenHeight40,
          right: -AppValues.width30,
          child: _CircleShape(radius: AppValues.height30, opacity: AppValues.opacity01),
        ),
        Positioned(
          top: AppValues.screenHeight50,
          left: AppValues.width30,
          child: _CircleShape(radius: AppValues.height25, opacity: AppValues.opacity01),
        ),
      ],
    );
  }
}

class _CircleShape extends StatelessWidget {
  final double radius;
  final double opacity;

  const _CircleShape({required this.radius, required this.opacity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * AppValues.fixed2,
      height: radius * AppValues.fixed2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.white.withOpacity(opacity),
      ),
    );
  }
}
