import 'package:fieldify/app/core/base/base_view.dart';
import 'package:fieldify/app/modules/register/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../l10n/app_translations.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/utils/app_values.dart';
import '../../../core/widgets/auth_leading_section.dart';
import '../../../core/widgets/auth_section_header.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_buttons.dart';
import '../../../core/widgets/custom_text_fields.dart';
import '../../login/widgets/validation_message_text_widget.dart';

class RegisterView extends BaseView<RegisterController> {
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
                child: registerBody(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget registerBody() {
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
              title: AppTranslations.registerTitle.tr,
              subtitle: AppTranslations.registerSubtitle.tr,
            ),
            SizedBox(height: AppValues.height60),
            registerForm(),
            SizedBox(height: AppValues.height10),
            registerFooter(),
          ],
        ),
      ),
    );
  }

  Widget registerForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldFactory.createStandardTextField(
          controller: controller.nameController,
          hintText: AppTranslations.name.tr,
          title: AppTranslations.name.tr,
          iconPath: AppImages.nameIcon,
          onChanged: (_) => controller.validateName(),
        ),
        Obx(() => ValidationTextMessage(
              message: controller.nameMessage.value.message,
              color: controller.nameMessage.value.color,
            )),
        SizedBox(height: AppValues.height10),
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
        SizedBox(height: AppValues.height10),
        TextFieldFactory.createPasswordField(
          controller: controller.passwordController,
          hintText: AppTranslations.password.tr,
          title: AppTranslations.password.tr,
          iconPath: AppImages.passwordIcon,
          onChanged: (_) => controller.validatePassword(),
        ),
        Obx(() => ValidationTextMessage(
              message: controller.passwordMessage.value.message,
              color: controller.passwordMessage.value.color,
            )),
        SizedBox(height: AppValues.height20),
        ButtonFactory.primary(
          title: AppTranslations.register.tr,
          onPressed: controller.login,
        ),
      ],
    );
  }

  Widget registerFooter() {
    return ButtonFactory.richTextFooter(
      title: AppTranslations.alreadyHaveAccount.tr,
      alignment: MainAxisAlignment.center,
      clickableText: AppTranslations.login.tr,
      callback: () => Get.back(),
    );
  }
}
