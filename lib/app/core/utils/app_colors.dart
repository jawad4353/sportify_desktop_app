import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryBlue = Color(0xFF1e319d);
  static const Color primaryBlueDark = Color(0xFF121a4d);
  static const Color primaryBlueLight = Color(0xFF5d6fc7);
  static const Color primary = Color(0xFF1e319d);
  static const Color primaryLight = Color(0xFF5d6fc7);
  static const Color primaryDark = Color(0xFF121a4d);
  static const Color red = Colors.red;
  static const Color green = Colors.green;
  static MaterialColor primaryBlueSwatch = const MaterialColor(
    0xFF1e319d,
    <int, Color>{
      50: Color(0xFFE8EBF5),
      100: Color(0xFFC5CCE8),
      200: Color(0xFF9FABD9),
      300: Color(0xFF7989CA),
      400: Color(0xFF5d6fc7),
      500: Color(0xFF1e319d),
      600: Color(0xFF1a2a8a),
      700: Color(0xFF162377),
      800: Color(0xFF121a4d),
      900: Color(0xFF0f1538),
    },
  );

  // Light Theme Colors
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color lightSurface = Color(0xFFF5F5F5);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightTextPrimary = Color(0xFF212121);
  static const Color lightTextSecondary = Color(0xFF757575);
  static const Color lightTextHint = Color(0xFFBDBDBD);
  static const Color lightDivider = Color(0xFFE0E0E0);
  static const Color lightBorder = Color(0xFFE0E0E0);
  static const Color lightError = Color(0xFFD32F2F);

  // Dark Theme Colors
  static const Color darkBackground = Color(0xFF2D2D2D);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkCard = Color(0xFF2C2C2C);
  static const Color darkTextPrimary = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFFB3B3B3);
  static const Color darkTextHint = Color(0xFF666666);
  static const Color darkDivider = Color(0xFF333333);
  static const Color darkBorder = Color(0xFF333333);
  static const Color darkError = Color(0xFFCF6679);

  // Common Colors
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color transparent = Colors.transparent;
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF2196F3);
  static const Color error = Color(0xFFE53E3E);
  static const Color grey = Color(0xFF9E9E9E);
  static const Color greyText = Color(0xFF858585);
}
