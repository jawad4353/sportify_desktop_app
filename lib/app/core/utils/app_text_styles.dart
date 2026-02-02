import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_values.dart';

class AppFontFamilies {
  static String roboto = 'Roboto';
  static String nunito = 'Nunito';
}

class AppTextStyles {
  // Roboto Font Styles
  static TextStyle get robotoTwelve => TextStyle(
        fontFamily: AppFontFamilies.roboto,
        fontSize: AppValues.font12,
        fontWeight: FontWeight.w400,
        height: AppValues.textHeight1_5,
        color: Get.theme.textTheme.bodyMedium?.color ?? Colors.black,
      );

  static TextStyle get robotoTwelveMedium => TextStyle(
        fontFamily: AppFontFamilies.roboto,
        fontSize: AppValues.font12,
        fontWeight: FontWeight.w500,
        height: AppValues.textHeight1_5,
        color: Get.theme.textTheme.bodyMedium?.color ?? Colors.black,
      );

  static TextStyle get robotoFourteen => TextStyle(
        fontFamily: AppFontFamilies.roboto,
        fontSize: AppValues.font14,
        fontWeight: FontWeight.w400,
        height: AppValues.textHeight1_5,
        color: Get.theme.textTheme.bodyMedium?.color ?? Colors.black,
      );

  static TextStyle get robotoFourteenMedium => TextStyle(
        fontFamily: AppFontFamilies.roboto,
        fontSize: AppValues.font14,
        fontWeight: FontWeight.w500,
        height: AppValues.textHeight1_5,
        color: Get.theme.textTheme.bodyMedium?.color ?? Colors.black,
      );

  static TextStyle get robotoFifteen => TextStyle(
        fontFamily: AppFontFamilies.roboto,
        fontSize: AppValues.font16,
        fontWeight: FontWeight.w400,
        height: AppValues.textHeight1_5,
        color: Get.theme.textTheme.bodyMedium?.color ?? Colors.black,
      );

  static TextStyle get robotoSixteen => TextStyle(
        fontFamily: AppFontFamilies.roboto,
        fontSize: AppValues.font16,
        fontWeight: FontWeight.w400,
        height: AppValues.textHeight1_5,
        color: Get.theme.textTheme.bodyMedium?.color ?? Colors.black,
      );

  static TextStyle get robotoSixteenMedium => TextStyle(
        fontFamily: AppFontFamilies.roboto,
        fontSize: AppValues.font16,
        fontWeight: FontWeight.w500,
        height: AppValues.textHeight1_5,
        color: Get.theme.textTheme.bodyMedium?.color ?? Colors.black,
      );

  static TextStyle get robotoEighteen => TextStyle(
        fontFamily: AppFontFamilies.roboto,
        fontSize: AppValues.font18,
        fontWeight: FontWeight.w400,
        height: AppValues.textHeight1_3,
        color: Get.theme.textTheme.bodyMedium?.color ?? Colors.black,
      );

  static TextStyle get robotoEighteenMedium => TextStyle(
        fontFamily: AppFontFamilies.roboto,
        fontSize: AppValues.font18,
        fontWeight: FontWeight.w500,
        height: AppValues.textHeight1_3,
        color: Get.theme.textTheme.bodyMedium?.color ?? Colors.black,
      );

  static TextStyle get robotoTwenty => TextStyle(
        fontFamily: AppFontFamilies.roboto,
        fontSize: AppValues.font20,
        fontWeight: FontWeight.w400,
        height: AppValues.textHeight1_3,
        color: Get.theme.textTheme.bodyMedium?.color ?? Colors.black,
      );

  static TextStyle get robotoTwentyMedium => TextStyle(
        fontFamily: AppFontFamilies.roboto,
        fontSize: AppValues.font20,
        fontWeight: FontWeight.w500,
        height: AppValues.textHeight1_3,
        color: Get.theme.textTheme.bodyMedium?.color ?? Colors.black,
      );

  static TextStyle get robotoTwentyFour => TextStyle(
        fontFamily: AppFontFamilies.roboto,
        fontSize: AppValues.font24,
        fontWeight: FontWeight.w400,
        height: AppValues.textHeight1_2,
        color: Get.theme.textTheme.bodyMedium?.color ?? Colors.black,
      );

  static TextStyle get robotoTwentyFourMedium => TextStyle(
        fontFamily: AppFontFamilies.roboto,
        fontSize: AppValues.font24,
        fontWeight: FontWeight.w500,
        height: AppValues.textHeight1_2,
        color: Get.theme.textTheme.bodyMedium?.color ?? Colors.black,
      );

  // Nunito Font Styles
  static TextStyle get nunitoTwelve => TextStyle(
        fontFamily: AppFontFamilies.nunito,
        fontSize: AppValues.font12,
        fontWeight: FontWeight.w400,
        height: AppValues.textHeight1_5,
        color: Get.theme.textTheme.bodyMedium?.color ?? Colors.black,
      );

  static TextStyle get nunitoTwelveMedium => TextStyle(
        fontFamily: AppFontFamilies.nunito,
        fontSize: AppValues.font12,
        fontWeight: FontWeight.w500,
        height: AppValues.textHeight1_5,
        color: Get.theme.textTheme.bodyMedium?.color ?? Colors.black,
      );

  static TextStyle get nunitoFourteen => TextStyle(
        fontFamily: AppFontFamilies.nunito,
        fontSize: AppValues.font14,
        fontWeight: FontWeight.w400,
        height: AppValues.textHeight1_5,
        color: Get.theme.textTheme.bodyMedium?.color ?? Colors.black,
      );

  static TextStyle get nunitoFourteenMedium => TextStyle(
        fontFamily: AppFontFamilies.nunito,
        fontSize: AppValues.font14,
        fontWeight: FontWeight.w500,
        height: AppValues.textHeight1_5,
        color: Get.theme.textTheme.bodyMedium?.color ?? Colors.black,
      );

  static TextStyle get nunitoSixteen => TextStyle(
        fontFamily: AppFontFamilies.nunito,
        fontSize: AppValues.font16,
        fontWeight: FontWeight.w400,
        height: AppValues.textHeight1_5,
        color: Get.theme.textTheme.bodyMedium?.color ?? Colors.black,
      );

  static TextStyle get nunitoSixteenMedium => TextStyle(
        fontFamily: AppFontFamilies.nunito,
        fontSize: AppValues.font16,
        fontWeight: FontWeight.w500,
        height: AppValues.textHeight1_5,
        color: Get.theme.textTheme.bodyMedium?.color ?? Colors.black,
      );

  static TextStyle get nunitoEighteen => TextStyle(
        fontFamily: AppFontFamilies.nunito,
        fontSize: AppValues.font18,
        fontWeight: FontWeight.w400,
        height: AppValues.textHeight1_3,
        color: Get.theme.textTheme.bodyMedium?.color ?? Colors.black,
      );

  static TextStyle get nunitoEighteenMedium => TextStyle(
        fontFamily: AppFontFamilies.nunito,
        fontSize: AppValues.font18,
        fontWeight: FontWeight.w500,
        height: AppValues.textHeight1_3,
        color: Get.theme.textTheme.bodyMedium?.color ?? Colors.black,
      );

  static TextStyle get nunitoTwenty => TextStyle(
        fontFamily: AppFontFamilies.nunito,
        fontSize: AppValues.font20,
        fontWeight: FontWeight.w400,
        height: AppValues.textHeight1_3,
        color: Get.theme.textTheme.bodyMedium?.color ?? Colors.black,
      );

  static TextStyle get nunitoTwentyMedium => TextStyle(
        fontFamily: AppFontFamilies.nunito,
        fontSize: AppValues.font20,
        fontWeight: FontWeight.w500,
        height: AppValues.textHeight1_3,
        color: Get.theme.textTheme.bodyMedium?.color ?? Colors.black,
      );

  static TextStyle get nunitoTwentyFour => TextStyle(
        fontFamily: AppFontFamilies.nunito,
        fontSize: AppValues.font24,
        fontWeight: FontWeight.w400,
        height: AppValues.textHeight1_2,
        color: Get.theme.textTheme.bodyMedium?.color ?? Colors.black,
      );

  static TextStyle get nunitoTwentyFourMedium => TextStyle(
        fontFamily: AppFontFamilies.nunito,
        fontSize: AppValues.font24,
        fontWeight: FontWeight.w500,
        height: AppValues.textHeight1_2,
        color: Get.theme.textTheme.bodyMedium?.color ?? Colors.black,
      );
}
