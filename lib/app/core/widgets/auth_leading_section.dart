import 'package:fieldify/l10n/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_text_styles.dart';
import '../utils/app_values.dart';
import 'leading_section_clipper.dart';

class AuthLeadingSection extends StatelessWidget {
  const AuthLeadingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: LeadingSectionCurvedClipper(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: constraints.maxWidth,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primary,
                  AppColors.primaryDark,
                  AppColors.primaryBlueSwatch[700]!,
                ],
              ),
            ),
            child: Stack(
              children: [
                _buildShapes(context),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppValues.padding30,
                      vertical: AppValues.padding20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              AppImages.logoLightTheme,
                              width: AppValues.width48,
                              height: AppValues.height48,
                            ),
                            SizedBox(height: AppValues.height24),
                            Text(
                              AppTranslations.authLeadingTitle.tr,
                              style: AppTextStyles.robotoTwenty.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
                                height: AppValues.textHeight1_2,
                              ),
                            ),
                            SizedBox(height: AppValues.height12),
                            Text(
                              AppTranslations.authLeadingSubtitle.tr,
                              style: AppTextStyles.robotoFourteen.copyWith(
                                color: AppColors.white.withOpacity(AppValues.opacity07),
                                height: AppValues.textHeight1_5,
                              ),
                            ),
                            SizedBox(height: AppValues.height24),
                            _buildBullet(
                              context,
                              AppTranslations.authLeadingBullet1.tr,
                            ),
                            SizedBox(height: AppValues.height10),
                            _buildBullet(
                              context,
                              AppTranslations.authLeadingBullet2.tr,
                            ),
                            SizedBox(height: AppValues.height10),
                            _buildBullet(
                              context,
                              AppTranslations.authLeadingBullet3.tr,
                            ),
                          ],
                        ),
                        Text(
                          AppTranslations.authLeadingCopyright.tr,
                          style: AppTextStyles.robotoTwelve.copyWith(
                            color: AppColors.white.withOpacity(AppValues.opacity06),
                          ),
                        ),
                      ],
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

  Widget _buildBullet(BuildContext context, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.check_circle_rounded,
          size: AppValues.font20,
          color: AppColors.success,
        ),
        SizedBox(width: AppValues.margin12),
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.robotoFourteen.copyWith(
              color: AppColors.white.withOpacity(AppValues.opacity07),
              height: AppValues.textHeight1_5,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildShapes(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: AppValues.screenHeight10,
          right: -AppValues.width40,
          child: _CircleShape(radius: AppValues.height100, opacity: 0.06),
        ),
        Positioned(
          top: AppValues.screenHeight40,
          left: -AppValues.width50,
          child: _CircleShape(radius: AppValues.height50, opacity: 0.05),
        ),
        Positioned(
          bottom: AppValues.screenHeight15,
          right: AppValues.margin20,
          child: _CircleShape(radius: AppValues.height40, opacity: 0.06),
        ),
        Positioned(
          bottom: AppValues.screenHeight40,
          right: -AppValues.width30,
          child: _CircleShape(radius: AppValues.height30, opacity: 0.04),
        ),
        Positioned(
          top: AppValues.screenHeight50,
          left: AppValues.width30,
          child: _CircleShape(radius: AppValues.height25, opacity: 0.05),
        ),
        Positioned(
          bottom: AppValues.screenHeight25,
          left: AppValues.width40,
          child: Opacity(
            opacity: 0.08,
            child: SvgPicture.asset(
              AppImages.boardingFirstImage,
              width: AppValues.height150,
              height: AppValues.height150,
            ),
          ),
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
