import 'dart:async';
import 'package:fieldify/app/core/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../l10n/app_translations.dart';
import '../../../core/utils/app_images.dart';
import '../../../routes/app_pages.dart';

class BoardingController extends BaseController {
  final List<String> listOnboardingTopTitles = [
    AppTranslations.boardingTopTitleOne.tr,
    AppTranslations.boardingTopTitleTwo.tr,
    AppTranslations.boardingTopTitleThree.tr,
  ];

  final List<String> listOnboardingSubtitles = [
    AppTranslations.boardingSubtitleOne.tr,
    AppTranslations.boardingSubtitleTwo.tr,
    AppTranslations.boardingSubtitleThree.tr,
  ];
  final List<String> listOnboardingImages = [
    AppImages.boardingThirdImage,
    AppImages.boardingSecondImage,
    AppImages.boardingFirstImage,
  ];
  final currentPage = 0.obs;
  late PageController pageController;
  Timer? _pageTimer;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
    _startAutoPageTransition();
  }

  void _startAutoPageTransition() {
    _pageTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageController.hasClients) {
        int nextPage = currentPage.value + 1;
        if (nextPage >= listOnboardingTopTitles.length) {
          nextPage = 0;
        }
        pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void navigateToLogin() {
    _pageTimer?.cancel();
    Get.offNamed(Routes.LOGIN);
  }


}
