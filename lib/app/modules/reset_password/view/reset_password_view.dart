import 'package:fieldify/app/core/base/base_view.dart';
import 'package:fieldify/app/core/widgets/custom_appbar.dart';
import 'package:fieldify/app/core/widgets/custom_buttons.dart';
import 'package:fieldify/app/core/widgets/custom_text_fields.dart';
import 'package:fieldify/app/modules/reset_password/controller/reset_password_controller.dart';
import 'package:fieldify/l10n/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/utils/app_values.dart';
import '../../../core/widgets/auth_leading_section.dart';
import '../../../core/widgets/auth_section_header.dart';
import '../widgets/validation_message_text_widget.dart';

class ResetPasswordView extends BaseView<ResetPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBars.authScreenAppBar(context: context),
      body: Row(
        children: [
          Expanded(
            flex: 45,
            child: const AuthLeadingSection(),
          ),
          Expanded(
            flex: 55,
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: AppValues.kDesktopMaxFormWidth),
                child: _body(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppValues.padding30,
          vertical: AppValues.padding6,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppValues.screenHeight * 0.05),
            AuthSectionHeader(
              title: AppTranslations.titleResetPassword.tr,
              subtitle: AppTranslations.subtitleResetPassword.tr,
            ),
            SizedBox(height: AppValues.height60),
            TextFieldFactory.createStandardTextField(
              controller: controller.emailController,
              hintText: AppTranslations.email.tr,
              title: AppTranslations.email.tr,
              iconPath: AppImages.emailIcon,
              onChanged: (_) => controller.validateEmail(),
            ),
            Obx(() => ValidationTextMessage(
                  message: controller.emailMessage.value.message,
                  color: controller.emailMessage.value.color,
                )),
            ButtonFactory.primary(
                title: AppTranslations.login.tr,
                onPressed: () {
                  logger.i('f');
                }),
            SizedBox(
              height: AppValues.height10,
            ),
            ButtonFactory.richTextFooter(
                title: AppTranslations.alreadyHaveAccount.tr,
                alignment: MainAxisAlignment.center,
                clickableText: AppTranslations.login.tr,
                callback: () {
                  Get.back();
                })
          ],
        ),
      ),
    );
  }
}
