import 'package:fieldify/app/core/base/base_view.dart';
import 'package:fieldify/app/core/widgets/custom_appbar.dart';
import 'package:fieldify/app/modules/refunds/controller/refunds_controller.dart';
import 'package:fieldify/l10n/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RefundsView extends BaseView<RefundsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBars.customAppBar(
        context: context,
        title: AppTranslations.refunds.tr,
      ),
      body: const Center(
        child: Text('Refunds Screen'),
      ),
    );
  }
}
