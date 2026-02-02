import 'package:flutter/material.dart';

import '../../../core/utils/app_text_styles.dart';
import '../../../core/utils/app_values.dart';

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppValues.padding16,
        right: AppValues.padding16,
        top: AppValues.padding20,
        bottom: AppValues.padding8,
      ),
      child: Text(
        title,
        style: AppTextStyles.robotoSixteenMedium.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
