import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/core/utils/app_values.dart';
import '/app/core/widgets/language_toggle_widget.dart';
import '../../../l10n/app_translations.dart';

class LanguageToggleCard extends StatelessWidget {
  const LanguageToggleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppValues.padding16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(AppValues.radius8),
        border: Border.all(
          color: Theme.of(context).dividerColor,
          width: AppValues.width1,
        ),
        boxShadow: [
          BoxShadow(
            color:
                Theme.of(context).shadowColor.withOpacity(AppValues.opacity02),
            blurRadius: AppValues.radius8,
            offset: Offset(0, AppValues.height2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(AppValues.padding12),
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .primaryColor
                  .withOpacity(AppValues.opacity02),
              borderRadius: BorderRadius.circular(AppValues.radius8),
            ),
            child: Icon(
              Icons.language,
              color: Theme.of(context).primaryColor,
              size: AppValues.font24,
            ),
          ),
          SizedBox(width: AppValues.width16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppTranslations.languageSettings.tr,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: AppValues.height4),
                Text(
                  AppTranslations.selectLanguage.tr,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).textTheme.bodySmall?.color,
                      ),
                ),
              ],
            ),
          ),
          const Flexible(child: LanguageToggleWidget()),
        ],
      ),
    );
  }
}
