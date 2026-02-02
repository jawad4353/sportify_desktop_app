import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../main.dart';
import '/app/bindings/initial_binding.dart';
import '/app/core/controllers/theme_controller.dart';
import '/app/core/utils/app_images.dart';
import '/app/core/utils/app_prefs.dart';
import '/app/core/utils/route_observer.dart';
import '/app/routes/app_pages.dart';
import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import '/l10n/translations.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static bool _hasPrecached = false;

  void _precacheBoardingImages(BuildContext context) {
    if (_hasPrecached) return;
    _hasPrecached = true;
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _precacheImages(context);
    });
  }

  Future<void> _precacheImages(BuildContext context) async {
    try {
      await Future.wait([
        precacheImage(const AssetImage(AppImages.boardingFirstImage), context),
        precacheImage(const AssetImage(AppImages.boardingSecondImage), context),
        precacheImage(const AssetImage(AppImages.boardingThirdImage), context),
        precacheImage(const AssetImage(AppImages.homeCardOne), context),
        precacheImage(const AssetImage(AppImages.homeCardTwo), context),
        precacheImage(const AssetImage(AppImages.homeCardThree), context),
      ]);
    } catch (e) {
      logger.e('Error precaching images: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final EnvConfig envConfig = BuildConfig.instance.config;
    _precacheBoardingImages(context);
    
    return ScreenUtilInit(
      designSize: const Size(1124, 868),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return GetBuilder<ThemeController>(
          builder: (themeController) {
            return GetMaterialApp(
              title: envConfig.appName,
              initialRoute: AppPages.INITIAL,
              initialBinding: InitialBinding(),
              getPages: AppPages.routes,
              navigatorObservers: [routeObserver],
              theme: themeController.lightTheme,
              darkTheme: themeController.darkTheme,
              themeMode: themeController.themeMode,
              translations: MyTranslations(),
              locale: _getInitialLocale(),
              fallbackLocale: const Locale('en', ''),
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: _getSupportedLocal(),
              debugShowCheckedModeBanner: false,
            );
          },
        );
      },
    );
  }

  List<Locale> _getSupportedLocal() {
    return [
      const Locale('en', ''),
      const Locale('es', ''),
    ];
  }

  Locale _getInitialLocale() {
    final prefs = Preferences.prefs;
    if (prefs != null) {
      final savedLocale = prefs.getString(AppPrefs.appLocale);
      if (savedLocale != null && savedLocale.isNotEmpty) {
        return savedLocale == 'es'
            ? const Locale('es', '')
            : const Locale('en', '');
      }
    }

    return Get.locale ?? const Locale('en', '');
  }
}
