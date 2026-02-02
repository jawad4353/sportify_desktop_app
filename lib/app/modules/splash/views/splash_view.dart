import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '/app/core/base/base_view.dart';
import '/app/core/utils/app_colors.dart';
import '/app/core/utils/app_images.dart';
import '/app/core/utils/app_values.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../controllers/splash_controller.dart';

class SplashView extends BaseView<SplashController> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Get.theme.brightness == Brightness.dark;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBars.splashScreenAppBar(context: context,),
      backgroundColor: isDarkMode ? AppColors.black : AppColors.primaryBlue,
      body: Stack(
        children: [
          Center(
            child: SvgPicture.asset(
              isDarkMode ? AppImages.logoDarkTheme : AppImages.logoLightTheme,
              width: AppValues.width50,
              height: AppValues.width50,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
