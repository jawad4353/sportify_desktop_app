import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_text_styles.dart';
import '../utils/app_values.dart';

// Factory class
class TextFieldFactory {
  static StandardTextField createStandardTextField({
    required TextEditingController controller,
    required String hintText,
    required String title,
    String? iconPath,
    IconData? icon,
    TextInputType? keyboardType,
    bool isReadOnly = false,
    GestureTapCallback? onTap,
    int maxLines = 1,
    TextInputFormatter? inputFormatter,
    void Function(String)? onChanged,
  }) {
    return StandardTextField(
      controller: controller,
      isReadOnly: isReadOnly,
      onTap: onTap,
      hintText: hintText,
      iconPath: iconPath,
      icon: icon,
      keyboardType: keyboardType,
      inputFormatter: inputFormatter,
      onChanged: onChanged,
      maxLines: maxLines,
    );
  }

  static PasswordField createPasswordField({
    required TextEditingController controller,
    required String hintText,
    final TextInputFormatter? inputFormatter,
    required String title,
    String? iconPath,
    IconData? icon,
    void Function(String)? onChanged,
  }) {
    return PasswordField(
      controller: controller,
      hintText: hintText,
      title: title,
      iconPath: iconPath,
      icon: icon,
      inputFormatter: inputFormatter,
      onChanged: onChanged,
    );
  }

  static SearchTextField createSearchField({
    required TextEditingController controller,
    required String hintText,
    required void Function(String)? onChanged,
    void Function(String)? onSubmitted,
  }) {
    return SearchTextField(
      controller: controller,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      hintText: hintText,
    );
  }
}

// Abstract class
abstract class CustomTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context);
}

class StandardTextField extends CustomTextField {
  final TextEditingController controller;
  final String hintText;
  final String? iconPath;
  final IconData? icon;
  final bool isReadOnly;
  final int maxLines;
  final GestureTapCallback? onTap;
  final TextInputType? keyboardType;
  final TextInputFormatter? inputFormatter;
  final void Function(String)? onChanged;

  StandardTextField({
    required this.maxLines,
    required this.isReadOnly,
    required this.onTap,
    required this.controller,
    required this.hintText,
    this.iconPath,
    this.icon,
    this.keyboardType,
    this.inputFormatter,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: isReadOnly,
      onTap: onTap,
      maxLines: maxLines,
      controller: controller,
      keyboardType: keyboardType,
      cursorColor: Get.theme.primaryColor,
      cursorWidth: AppValues.width2,
      cursorHeight: AppValues.height18,
      inputFormatters: inputFormatter != null ? [inputFormatter!] : null,
      onChanged: onChanged,
      style: AppTextStyles.robotoFourteen.copyWith(
        color: Get.theme.textTheme.bodyMedium?.color,
        fontSize: isReadOnly ? AppValues.font10 : AppValues.font14,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppValues.radius8),
          borderSide: BorderSide(
            color: Get.theme.brightness == Brightness.dark
                ? AppColors.darkTextSecondary
                : Get.theme.dividerColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppValues.radius8),
          borderSide: BorderSide(
            color: Get.theme.brightness == Brightness.dark
                ? AppColors.darkTextSecondary
                : Get.theme.dividerColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppValues.radius8),
          borderSide: BorderSide(
            color: Get.theme.brightness == Brightness.dark
                ? AppColors.darkTextSecondary
                : Get.theme.dividerColor,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppValues.radius8),
          borderSide: BorderSide(
            color: Get.theme.brightness == Brightness.dark
                ? AppColors.darkTextSecondary
                : Get.theme.dividerColor,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: AppValues.height14,
          horizontal: AppValues.width10,
        ),
        hintText: hintText,
        hintStyle: AppTextStyles.robotoFourteen.copyWith(
          color: Get.theme.hintColor,
        ),
        prefixIcon: iconPath != null
            ? Padding(
                padding: EdgeInsets.all(AppValues.width12),
                child: SvgPicture.asset(
                  iconPath!,
                  width: AppValues.width20,
                  height: AppValues.width20,
                  colorFilter: ColorFilter.mode(
                    AppColors.greyText.withOpacity(0.6),
                    BlendMode.srcIn,
                  ),
                ),
              )
            : icon != null
                ? Icon(
                    icon!,
                    color: AppColors.greyText,
                    size: AppValues.width20,
                  )
                : null,
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String title;
  final String? iconPath;
  final IconData? icon;
  final TextInputType? keyboardType;
  final TextInputFormatter? inputFormatter;
  final void Function(String)? onChanged;

  PasswordField({
    required this.controller,
    required this.hintText,
    required this.title,
    this.iconPath,
    this.icon,
    this.keyboardType,
    this.inputFormatter,
    this.onChanged,
  });

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: TextInputType.visiblePassword,
      cursorColor: Get.theme.primaryColor,
      cursorWidth: AppValues.width2,
      cursorHeight: AppValues.height18,
      inputFormatters:
          widget.inputFormatter != null ? [widget.inputFormatter!] : null,
      onChanged: widget.onChanged,
      obscureText: _obscureText,
      style: AppTextStyles.robotoFourteen.copyWith(
        color: Get.theme.textTheme.bodyMedium?.color,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppValues.radius8),
          borderSide: BorderSide(
            color: Get.theme.brightness == Brightness.dark
                ? AppColors.darkTextSecondary
                : Get.theme.dividerColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppValues.radius8),
          borderSide: BorderSide(
            color: Get.theme.brightness == Brightness.dark
                ? AppColors.darkTextSecondary
                : Get.theme.dividerColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppValues.radius8),
          borderSide: BorderSide(
            color: Get.theme.brightness == Brightness.dark
                ? AppColors.darkTextSecondary
                : Get.theme.dividerColor,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppValues.radius8),
          borderSide: BorderSide(
            color: Get.theme.brightness == Brightness.dark
                ? AppColors.darkTextSecondary
                : Get.theme.dividerColor,
          ),
        ),
        prefixIcon: widget.iconPath != null
            ? Padding(
                padding: EdgeInsets.all(AppValues.width12),
                child: SvgPicture.asset(
                  widget.iconPath!,
                  width: AppValues.width20,
                  height: AppValues.width20,
                  colorFilter: ColorFilter.mode(
                    AppColors.greyText.withOpacity(0.6),
                    BlendMode.srcIn,
                  ),
                ),
              )
            : widget.icon != null
                ? Icon(
                    widget.icon,
                    color: Get.theme.dividerColor,
                    size: AppValues.width20,
                  )
                : Icon(
                    Icons.password,
                    color: Get.theme.dividerColor,
                    size: AppValues.width20,
                  ),
        contentPadding: EdgeInsets.symmetric(
          vertical: AppValues.height15,
          horizontal: AppValues.width10,
        ),
        hintText: widget.hintText,
        hintStyle: AppTextStyles.robotoFourteen.copyWith(
          color: Get.theme.hintColor,
        ),
        suffixIcon: IconButton(
          icon: SvgPicture.asset(
            _obscureText
                ? AppImages.eyeVisibilityOff
                : AppImages.eyeVisibilityOn,
            width: AppValues.width22,
            height: AppValues.width22,
            colorFilter: ColorFilter.mode(
              Get.theme.primaryColor,
              BlendMode.srcIn,
            ),
          ),
          onPressed: _togglePasswordVisibility,
        ),
      ),
    );
  }
}

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;

  const SearchTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.onChanged,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Get.theme.brightness == Brightness.dark;
    
    return TextField(
      controller: controller,
      cursorColor: Get.theme.primaryColor,
      cursorWidth: AppValues.width2,
      cursorHeight: AppValues.height18,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      style: AppTextStyles.robotoFourteen.copyWith(
        color: Get.theme.textTheme.bodyMedium?.color,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppValues.radius8),
          borderSide: BorderSide(
            color: isDark
                ? AppColors.darkTextSecondary
                : Get.theme.dividerColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppValues.radius8),
          borderSide: BorderSide(
            color: isDark
                ? AppColors.darkTextSecondary
                : Get.theme.dividerColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppValues.radius8),
          borderSide: BorderSide(
            color: isDark
                ? AppColors.darkTextSecondary
                : Get.theme.dividerColor,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppValues.radius8),
          borderSide: BorderSide(
            color: isDark
                ? AppColors.darkTextSecondary
                : Get.theme.dividerColor,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: AppValues.height14,
          horizontal: AppValues.width10,
        ),
        hintText: hintText,
        hintStyle: AppTextStyles.robotoFourteen.copyWith(
          color: Get.theme.hintColor,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: AppColors.greyText.withOpacity(0.6),
          size: AppValues.width20,
        ),
      ),
    );
  }
}
