import 'package:fieldify/app/core/base/base_view.dart';
import 'package:fieldify/app/core/utils/app_text_styles.dart';
import 'package:fieldify/app/core/widgets/custom_appbar.dart';
import 'package:fieldify/app/core/widgets/custom_buttons.dart';
import 'package:fieldify/app/core/widgets/custom_text_fields.dart';
import 'package:fieldify/app/modules/login/controller/login_controller.dart';
import 'package:fieldify/l10n/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/utils/app_values.dart';
import '../../../core/widgets/auth_leading_section.dart';
import '../../../core/widgets/auth_section_header.dart';
import '../widgets/validation_message_text_widget.dart';

class LoginView extends BaseView<LoginController> {
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
                child: _loginBody(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _loginBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppValues.padding30,
          vertical: AppValues.padding6,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppValues.screenHeight * 0.03),
            AuthSectionHeader(
              title: AppTranslations.loginTitle.tr,
              subtitle: AppTranslations.loginSubtitle.tr,
            ),
            SizedBox(height: AppValues.height60),
            _loginForm(),
            _rememberMeRow(),
            SizedBox(height: AppValues.height20),
            ButtonFactory.primary(
              title: AppTranslations.login.tr,
              onPressed: () => controller.login(),
            ),
            SizedBox(height: AppValues.height20),
            _socialLoginRow(),
            _loginBottomSection(),
          ],
        ),
      ),
    );
  }

  Widget _loginForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
      ],
    );
  }

  Widget _rememberMeRow() {
    return Obx(() {
      return Row(
        children: [
          Checkbox(
            value: controller.rememberMe.value,
            onChanged: (value) => controller.setRememberMe(value ?? false),
          ),
          Text(AppTranslations.rememberMe.tr),
          const Spacer(),
          ButtonFactory.richTextFooter(
            title: '',
            alignment: MainAxisAlignment.end,
            clickableText: AppTranslations.forgotPassword.tr,
            callback: controller.navigateToForgetPassword,
          ),
        ],
      );
    });
  }

  Widget _socialLoginRow() {
    return Column(
      children: [
        SizedBox(height: AppValues.height10),
        Align(
          alignment: Alignment.center,
          child: Text(
            AppTranslations.or.tr,
            textAlign: TextAlign.center,
            style: AppTextStyles.robotoFourteen.copyWith(
              color: AppColors.greyText,
            ),
          ),
        ),
        SizedBox(height: AppValues.height10),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: AppValues.padding10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ButtonFactory.authButton(
                icon: AppImages.googleIcon,
                onClick: controller.signInWithGoogle,
              ),
              ButtonFactory.authButton(
                icon: AppImages.facebookIcon,
                onClick: controller.signInWithFacebook,
              ),

              ButtonFactory.authButton(
                icon: AppImages.appleIcon,
                onClick: controller.signInWithApple,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _loginBottomSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: AppValues.height20),
        ButtonFactory.richTextFooter(
          title: AppTranslations.dontHaveAccount.tr,
          alignment: MainAxisAlignment.center,
          clickableText: AppTranslations.register.tr,
          callback: controller.navigateToRegister,
        ),
      ],
    );
  }
}
