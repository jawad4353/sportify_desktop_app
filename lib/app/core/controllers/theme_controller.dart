import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/app/core/utils/app_colors.dart';
import '/app/core/utils/app_prefs.dart';
import '../../../main.dart';

class ThemeController extends GetxController {
  static ThemeController get to => Get.find();

  final _isDarkMode = false.obs;

  bool get isDarkMode => _isDarkMode.value;

  ThemeMode get themeMode =>
      _isDarkMode.value ? ThemeMode.dark : ThemeMode.light;

  @override
  void onInit() {
    super.onInit();
    _loadThemeFromPrefs();
  }

  Future<void> _loadThemeFromPrefs() async {
    try {
      final prefs = Preferences.prefs;
      if (prefs != null) {
        final valueTheme = prefs.getBool(AppPrefs.isDarkMode);
        logger.i('valueTheme $valueTheme');
        _isDarkMode.value = valueTheme ?? false;
        update();
        Get.changeThemeMode(themeMode);
      }
    } catch (e) {
      logger.e('Error loading theme preference: $e');
    }
  }

  Future<void> _saveThemeToPrefs() async {
    try {
      final prefs = Preferences.prefs;
      if (prefs != null) {
        await prefs.setBool(AppPrefs.isDarkMode, _isDarkMode.value);
      }
    } catch (e) {
      logger.e('Error saving theme preference: $e');
    }
  }

  Future<void> toggleTheme() async {
    _isDarkMode.value = !_isDarkMode.value;
    await _saveThemeToPrefs();
    update();
    Get.changeThemeMode(themeMode);
  }

  Future<void> setTheme(bool isDark) async {
    _isDarkMode.value = isDark;
    await _saveThemeToPrefs();
    update();
    Get.changeThemeMode(themeMode);
  }

  ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        primarySwatch: AppColors.primaryBlueSwatch,
        primaryColor: AppColors.primaryBlue,
        scaffoldBackgroundColor: AppColors.lightBackground,
        cardColor: AppColors.lightCard,
        dividerColor: AppColors.lightDivider,
        textTheme: TextTheme(
          displayLarge: TextStyle(
            color: AppColors.lightTextPrimary,
            fontSize: 32.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
          displayMedium: TextStyle(
            color: AppColors.lightTextPrimary,
            fontSize: 28.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
          displaySmall: TextStyle(
            color: AppColors.lightTextPrimary,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
          headlineLarge: TextStyle(
            color: AppColors.lightTextPrimary,
            fontSize: 22.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Roboto',
          ),
          headlineMedium: TextStyle(
            color: AppColors.lightTextPrimary,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Roboto',
          ),
          headlineSmall: TextStyle(
            color: AppColors.lightTextPrimary,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Roboto',
          ),
          titleLarge: TextStyle(
            color: AppColors.lightTextPrimary,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto',
          ),
          titleMedium: TextStyle(
            color: AppColors.lightTextPrimary,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto',
          ),
          titleSmall: TextStyle(
            color: AppColors.lightTextPrimary,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto',
          ),
          bodyLarge: TextStyle(
            color: AppColors.lightTextPrimary,
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            fontFamily: 'Roboto',
          ),
          bodyMedium: TextStyle(
            color: AppColors.lightTextPrimary,
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
            fontFamily: 'Roboto',
          ),
          bodySmall: TextStyle(
            color: AppColors.lightTextSecondary,
            fontSize: 12.sp,
            fontWeight: FontWeight.normal,
            fontFamily: 'Roboto',
          ),
          labelLarge: TextStyle(
            color: AppColors.lightTextPrimary,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto',
          ),
          labelMedium: TextStyle(
            color: AppColors.lightTextPrimary,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto',
          ),
          labelSmall: TextStyle(
            color: AppColors.lightTextSecondary,
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto',
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.lightBackground,
          foregroundColor: AppColors.lightTextPrimary,
          elevation: 0,
          centerTitle: true,
        ),
        cardTheme: CardTheme(
          color: AppColors.lightCard,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryBlue,
            foregroundColor: AppColors.black,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.lightBorder),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.lightBorder),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:
                const BorderSide(color: AppColors.primaryBlue, width: 2),
          ),
        ),
        fontFamily: 'Roboto',
      );

  // Get dark theme
  ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        primarySwatch: AppColors.primaryBlueSwatch,
        primaryColor: AppColors.primaryBlue,
        scaffoldBackgroundColor: AppColors.darkBackground,
        canvasColor: AppColors.darkBackground,
        cardColor: AppColors.darkCard,
        dividerColor: AppColors.darkDivider,
        textTheme: TextTheme(
          displayLarge: TextStyle(
            color: AppColors.darkTextPrimary,
            fontSize: 32.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
          displayMedium: TextStyle(
            color: AppColors.darkTextPrimary,
            fontSize: 28.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
          displaySmall: TextStyle(
            color: AppColors.darkTextPrimary,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
          headlineLarge: TextStyle(
            color: AppColors.darkTextPrimary,
            fontSize: 22.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Roboto',
          ),
          headlineMedium: TextStyle(
            color: AppColors.darkTextPrimary,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Roboto',
          ),
          headlineSmall: TextStyle(
            color: AppColors.darkTextPrimary,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Roboto',
          ),
          titleLarge: TextStyle(
            color: AppColors.darkTextPrimary,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto',
          ),
          titleMedium: TextStyle(
            color: AppColors.darkTextPrimary,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto',
          ),
          titleSmall: TextStyle(
            color: AppColors.darkTextPrimary,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto',
          ),
          bodyLarge: TextStyle(
            color: AppColors.darkTextPrimary,
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            fontFamily: 'Roboto',
          ),
          bodyMedium: TextStyle(
            color: AppColors.darkTextPrimary,
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
            fontFamily: 'Roboto',
          ),
          bodySmall: TextStyle(
            color: AppColors.darkTextSecondary,
            fontSize: 12.sp,
            fontWeight: FontWeight.normal,
            fontFamily: 'Roboto',
          ),
          labelLarge: TextStyle(
            color: AppColors.darkTextPrimary,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto',
          ),
          labelMedium: TextStyle(
            color: AppColors.darkTextPrimary,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto',
          ),
          labelSmall: TextStyle(
            color: AppColors.darkTextSecondary,
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto',
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.darkBackground,
          foregroundColor: AppColors.darkTextPrimary,
          elevation: 0,
          centerTitle: true,
        ),
        cardTheme: CardTheme(
          color: AppColors.darkCard,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryBlue,
            foregroundColor: AppColors.black,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.darkBorder),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.darkBorder),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:
                const BorderSide(color: AppColors.primaryBlue, width: 2),
          ),
        ),
        fontFamily: 'Roboto',
      );
}
