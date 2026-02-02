import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import '../utils/app_values.dart';

abstract class CustomButton {
  Widget build();
}

class PrimaryButton extends CustomButton {
  final VoidCallback onPressed;
  final String title;
  final Color bgColor;
  final Color fgColor;
  final bool showLeadingIcon;
  final String leadingIconPath;

  PrimaryButton({
    required this.onPressed,
    required this.title,
    this.bgColor = AppColors.primaryBlue,
    this.fgColor = AppColors.white,
    this.showLeadingIcon = false,
    this.leadingIconPath = '',
  });

  @override
  Widget build() {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        final effectiveBgColor =
            bgColor == AppColors.primaryBlue ? theme.primaryColor : bgColor;
        final effectiveFgColor = fgColor;

        return InkWell(
          onTap: onPressed,
          child: Container(
            height: AppValues.height43,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppValues.radius8),
              color: effectiveBgColor,
              boxShadow: [
                BoxShadow(
                  color: theme.shadowColor.withOpacity(0.2),
                  blurRadius: AppValues.radius1,
                  spreadRadius: AppValues.radius1,
                ),
              ],
            ),
            child: Center(
              child: showLeadingIcon
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          leadingIconPath,
                          height: AppValues.height18,
                          width: AppValues.height18,
                        ),
                        SizedBox(width: AppValues.width8),
                        Text(
                          title,
                          style: AppTextStyles.robotoFourteen
                              .copyWith(fontWeight: FontWeight.w500)
                              .copyWith(color: effectiveFgColor),
                        ),
                      ],
                    )
                  : Text(
                      title,
                      style: AppTextStyles.robotoFourteen
                          .copyWith(fontWeight: FontWeight.w600)
                          .copyWith(color: effectiveFgColor),
                    ),
            ),
          ),
        );
      },
    );
  }
}

class RichTextFooterButton extends CustomButton {
  final String title;
  final String clickableText;
  final MainAxisAlignment alignment;
  final VoidCallback callback;

  RichTextFooterButton({
    required this.title,
    required this.alignment,
    required this.clickableText,
    required this.callback,
  });

  @override
  Widget build() {
    final theme = Get.theme;

    return Align(
      alignment: _getAlignment(),
      child: RichText(
        text: TextSpan(
          text: "$title ",
          style: AppTextStyles.robotoFourteen.copyWith(
            color: theme.textTheme.bodyMedium?.color,
          ),
          children: [
            TextSpan(
              text: clickableText,
              style: AppTextStyles.robotoFourteenMedium.copyWith(
                color: theme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()..onTap = callback,
            ),
          ],
        ),
      ),
    );
  }

  Alignment _getAlignment() {
    switch (alignment) {
      case MainAxisAlignment.start:
        return Alignment.centerLeft;
      case MainAxisAlignment.end:
        return Alignment.centerRight;
      case MainAxisAlignment.center:
      default:
        return Alignment.center;
    }
  }
}

class AuthButton extends CustomButton {
  final String iconPath;
  final VoidCallback onPressed;

  AuthButton({
    required this.iconPath,
    required this.onPressed,
  });

  @override
  Widget build() {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        final isDark = theme.brightness == Brightness.dark;

        return InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(AppValues.radius8),
          splashColor: isDark
              ? AppColors.darkTextSecondary.withOpacity(0.2)
              : AppColors.greyText.withOpacity(0.1),
          highlightColor: isDark
              ? AppColors.darkTextSecondary.withOpacity(0.1)
              : AppColors.greyText.withOpacity(0.05),
          child: Container(
            width: AppValues.width56,
            height: AppValues.width56,
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkCard : AppColors.white,
              borderRadius: BorderRadius.circular(AppValues.radius8),
              boxShadow: [
                BoxShadow(
                  color: theme.shadowColor.withOpacity(0.1),
                  blurRadius: 4,
                  spreadRadius: 0,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: SvgPicture.asset(
                iconPath,
                width: AppValues.width25,
                height: AppValues.width25,
              ),
            ),
          ),
        );
      },
    );
  }
}

class LevelButton extends CustomButton {
  final String title;
  final bool isActive;
  final Function onTap;

  LevelButton({
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build() {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);

        return Padding(
          padding: EdgeInsets.only(right: AppValues.width8),
          child: ElevatedButton(
            onPressed: () => onTap(),
            style: ElevatedButton.styleFrom(
              backgroundColor: isActive
                  ? theme.primaryColor
                  : theme.colorScheme.surfaceVariant,
              foregroundColor:
                  isActive ? theme.colorScheme.onPrimary : theme.primaryColor,
              padding: EdgeInsets.symmetric(
                horizontal: AppValues.width12,
                vertical: AppValues.height8,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppValues.radius8),
              ),
            ),
            child: Text(
              title,
              style: AppTextStyles.robotoFourteen.copyWith(
                color:
                    isActive ? theme.colorScheme.onPrimary : theme.primaryColor,
              ),
            ),
          ),
        );
      },
    );
  }
}

class ButtonFactory {
  static Widget primary({
    required VoidCallback onPressed,
    required String title,
    Color bgColor = AppColors.primaryBlue,
    Color fgColor = AppColors.white,
    bool showLeadingIcon = false,
    String leadingIconPath = '',
  }) {
    return PrimaryButton(
      onPressed: onPressed,
      title: title,
      bgColor: bgColor,
      fgColor: fgColor,
      showLeadingIcon: showLeadingIcon,
      leadingIconPath: leadingIconPath,
    ).build();
  }

  static Widget richTextFooter({
    required String title,
    required MainAxisAlignment alignment,
    required String clickableText,
    required VoidCallback callback,
  }) {
    return RichTextFooterButton(
      title: title,
      alignment: alignment,
      clickableText: clickableText,
      callback: callback,
    ).build();
  }

  static Widget level({
    required String title,
    required bool isActive,
    required Function onTap,
  }) {
    return LevelButton(
      title: title,
      isActive: isActive,
      onTap: onTap,
    ).build();
  }

  static Widget authButton({
    required String icon,
    required VoidCallback onClick,
  }) {
    return AuthButton(
      iconPath: icon,
      onPressed: onClick,
    ).build();
  }
}
