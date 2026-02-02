import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/core/utils/app_prefs.dart';
import '/app/core/utils/app_values.dart';
import '../../../l10n/app_translations.dart';

class LanguageToggleWidget extends StatelessWidget {
  const LanguageToggleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentLocale = Get.locale?.languageCode ?? 'en';

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppValues.padding12,
        vertical: AppValues.padding2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(AppValues.opacity02),
        borderRadius: BorderRadius.circular(AppValues.radius8),
        border: Border.all(
          color: Theme.of(context).dividerColor,
          width: AppValues.width1,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: currentLocale,
          icon: Icon(
            Icons.language,
            color: Theme.of(context).primaryColor,
            size: AppValues.font18,
          ),
          iconSize: AppValues.font18,
          isDense: true,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).textTheme.bodyMedium?.color,
                fontSize: AppValues.font14,
              ),
          dropdownColor: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(AppValues.radius8),
          items: [
            DropdownMenuItem<String>(
              value: 'en',
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: AppValues.padding4),
                child: Row(
                  children: [
                    Text('🇺🇸', style: TextStyle(fontSize: AppValues.font16)),
                    SizedBox(width: AppValues.width8),
                    Text(AppTranslations.english.tr),
                  ],
                ),
              ),
            ),
            DropdownMenuItem<String>(
              value: 'es',
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: AppValues.padding4),
                child: Row(
                  children: [
                    Text('🇪🇸', style: TextStyle(fontSize: AppValues.font16)),
                    SizedBox(width: AppValues.width8),
                    Text(AppTranslations.spanish.tr),
                  ],
                ),
              ),
            ),
          ],
          onChanged: (String? newValue) {
            if (newValue != null && newValue != currentLocale) {
              _changeLanguage(newValue);
            }
          },
        ),
      ),
    );
  }

  void _changeLanguage(String languageCode) async {
    Locale locale;
    switch (languageCode) {
      case 'es':
        locale = const Locale('es', '');
        break;
      case 'en':
      default:
        locale = const Locale('en', '');
        break;
    }

    Get.updateLocale(locale);
    final prefs = Preferences.prefs;
    if (prefs != null) {
      await prefs.setString(AppPrefs.appLocale, languageCode);
    }
  }
}
