import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fieldify/app/core/utils/app_colors.dart';
import 'package:fieldify/app/core/utils/app_text_styles.dart';
import 'package:fieldify/app/core/utils/app_values.dart';
import 'package:fieldify/app/core/utils/app_images.dart';

class SportItemDetail extends StatelessWidget {
  final String sportName;
  final String? iconPath;

  const SportItemDetail({
    Key? key,
    required this.sportName,
    this.iconPath,
  }) : super(key: key);

  static final Map<String, String> _sportIconMap = {
    'football': AppImages.footBallIcon,
    'soccer': AppImages.footBallIcon,
    'cricket': AppImages.cricketIcon,
    'basketball': AppImages.basketBallIcon,
    'badminton': AppImages.badmintonIcon,
    'volleyball': AppImages.volleyBallIcon,
    'table tennis': AppImages.tableTennisIcon,
    'ping pong': AppImages.tableTennisIcon,
    'snooker': AppImages.snookerIcon,
    'gym': AppImages.dumbullIcon,
    'dumbbell': AppImages.dumbullIcon,
  };

  String get _iconPath {
    if (iconPath != null) {
      return iconPath!;
    }

    final lowerSport = sportName.toLowerCase();
    for (final entry in _sportIconMap.entries) {
      if (lowerSport.contains(entry.key)) {
        return entry.value;
      }
    }

    return AppImages.cricketIcon;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;


    return Container(
      width: AppValues.width70,
      height: AppValues.width70,
     margin: EdgeInsets.symmetric(horizontal: AppValues.padding4),
     clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkCard
            : AppColors.lightCard,
        borderRadius: BorderRadius.circular(AppValues.radius10),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withOpacity(isDark ? 0.3 : 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: AppValues.padding4,vertical: AppValues.padding2),
              child: Text(
                sportName,
                style: AppTextStyles.robotoTwelve.copyWith(
                  color: isDark
                      ? AppColors.darkTextPrimary
                      : AppColors.lightTextPrimary,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -AppValues.width8,
            right: -AppValues.width8,
            child: SvgPicture.asset(
              _iconPath,
              width: AppValues.width45,
              height: AppValues.width45,
            ),
          ),
        ],
      ),
    );
  }
}
