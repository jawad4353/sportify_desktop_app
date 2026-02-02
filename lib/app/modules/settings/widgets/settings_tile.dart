import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/app_images.dart';
import '../../../core/utils/app_text_styles.dart';
import '../../../core/utils/app_values.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final String? iconPath;
  final IconData? icon;
  final VoidCallback? onTap;

  const SettingsTile({
    Key? key,
    required this.title,
    this.icon,
    this.iconPath,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppValues.margin16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(AppValues.radius8),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppValues.radius8),
        child: Container(
          height: AppValues.height56,
          padding: EdgeInsets.symmetric(
            horizontal: AppValues.padding16,
          ),
          child: Row(
            children: [
              Container(
                width: AppValues.width40,
                height: AppValues.width40,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppValues.radius8),
                ),
                child: Center(
                  child: iconPath != null
                      ? SvgPicture.asset(
                          iconPath!,
                          width: AppValues.width20,
                          height: AppValues.width20,
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).primaryColor,
                            BlendMode.srcIn,
                          ),
                        )
                      : Icon(
                          icon,
                          color: Theme.of(context).primaryColor,
                          size: AppValues.font20,
                        ),
                ),
              ),
              SizedBox(width: AppValues.width16),
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.robotoSixteen,
                ),
              ),
              SvgPicture.asset(
                AppImages.arrowForwardIcon,
                width: AppValues.width15,
                height: AppValues.width15,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).textTheme.bodyMedium?.color ?? Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
