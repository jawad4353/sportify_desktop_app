import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_text_styles.dart';
import '../utils/app_values.dart';

class AppBars {
  static PreferredSize customAppBar({
    required String title,
    required BuildContext context,
    Widget? leading,
    double additionalHeight=20,
    double leadingWidth = 100,
    bool showTrailing = false,
    bool showLeading = true,
    Widget? trailingWidget,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return PreferredSize(
      preferredSize:  Size.fromHeight(kToolbarHeight + additionalHeight),
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkBackground : AppColors.white,
        ),
        child: AppBar(
          surfaceTintColor: isDark ? AppColors.darkBackground : AppColors.white,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leadingWidth: leadingWidth,
          elevation: 0,
          centerTitle: true,
          titleSpacing: AppValues.width10,

          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness:
                isDark ? Brightness.light : Brightness.dark,
            statusBarColor: Colors.transparent,
          ),

          actions: [
            if (showTrailing && trailingWidget != null) trailingWidget,
          ],

          leading:showLeading? leading?? GestureDetector(
            onTap: () => Get.back(),
            child: Center(
              child: SvgPicture.asset(
                AppImages.arrowBackIcon,
                width: AppValues.width24,
                height: AppValues.width24,
                colorFilter: ColorFilter.mode(
                  isDark ? AppColors.white : AppColors.primaryBlueDark,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ):null,

          title: Text(
            title,
            style: AppTextStyles.robotoSixteen.copyWith(
              color: isDark ? AppColors.white : AppColors.primaryBlueDark,
            ),
          ),
        ),
      ),
    );
  }

  static AppBar authScreenAppBar({
    required BuildContext context,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return AppBar(
      elevation: 0,
      backgroundColor: theme.scaffoldBackgroundColor,
      toolbarHeight: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor:isDark? AppColors.darkBackground: AppColors.white,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      ),
    );
  }

  static AppBar splashScreenAppBar({
    required BuildContext context,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return AppBar(
      elevation: 0,
      backgroundColor: isDark ? AppColors.black : AppColors.primaryBlue,
      toolbarHeight: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: isDark ? AppColors.black : AppColors.primaryBlue,
        statusBarIconBrightness:  Brightness.light ,
      ),
    );
  }
}
