import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/core/controllers/theme_controller.dart';
import '../../../l10n/app_translations.dart';

class ThemeToggleWidget extends StatelessWidget {
  const ThemeToggleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (controller) {
        return IconButton(
          onPressed: () => controller.toggleTheme(),
          icon: Icon(
            controller.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            color: Theme.of(context).textTheme.titleMedium?.color,
          ),
          tooltip: controller.isDarkMode
              ? AppTranslations.switchToLightMode.tr
              : AppTranslations.switchToDarkMode.tr,
        );
      },
    );
  }
}

class ThemeToggleCard extends StatelessWidget {
  const ThemeToggleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (controller) {
        return Card(
          color: Theme.of(context).cardColor,
          child: ListTile(
            leading: Icon(
              controller.isDarkMode ? Icons.dark_mode : Icons.light_mode,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              controller.isDarkMode
                  ? AppTranslations.darkMode.tr
                  : AppTranslations.lightMode.tr,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text(
              controller.isDarkMode
                  ? AppTranslations.switchToLightMode.tr
                  : AppTranslations.switchToDarkMode.tr,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            trailing: Switch(
              value: controller.isDarkMode,
              onChanged: (value) => controller.setTheme(value),
              activeColor: Theme.of(context).primaryColor,
            ),
            onTap: () => controller.toggleTheme(),
          ),
        );
      },
    );
  }
}
