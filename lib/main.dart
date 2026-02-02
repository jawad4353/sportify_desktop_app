import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'app/core/controllers/theme_controller.dart';
import 'app/core/utils/app_prefs.dart';
import 'app/my_app.dart';
import 'flavors/build_config.dart';
import 'flavors/env_config.dart';
import 'flavors/environment.dart';

Logger logger = new Logger(
  printer: kReleaseMode ? null : PrettyPrinter(),
);

Future<void> main() async {
  EnvConfig config = EnvConfig(
    appName: "Flutter GetX Template",
    baseUrl: "https://api.github.com",
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.PRODUCTION,
    envConfig: config,
  );
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences().initializePrefs();

  await _initializeLocale();

  Get.put(ThemeController(), permanent: true);

  runApp(const MyApp());
}

Future<void> _initializeLocale() async {
  final prefs = Preferences.prefs;
  if (prefs != null) {
    final savedLocale = prefs.getString(AppPrefs.appLocale);

    if (savedLocale == null || savedLocale.isEmpty) {
      final systemLocale = Get.deviceLocale ?? const Locale('en', '');
      String localeCode;

      if (systemLocale.languageCode == 'es') {
        localeCode = 'es';
      } else {
        localeCode = 'en';
      }

      await prefs.setString(AppPrefs.appLocale, localeCode);
      final locale =
          localeCode == 'es' ? const Locale('es', '') : const Locale('en', '');
      Get.updateLocale(locale);
    } else {
      final locale =
          savedLocale == 'es' ? const Locale('es', '') : const Locale('en', '');
      Get.updateLocale(locale);
    }
  }
}
