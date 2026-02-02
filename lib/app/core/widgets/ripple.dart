import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_values.dart';

class Ripple extends StatelessWidget {
  final Function()? onTap;
  final Widget? child;
  final Color rippleColor;
  final double rippleRadius;

  const Ripple({
    Key? key,
    this.child,
    required this.onTap,
    this.rippleColor = AppColors.primaryBlue,
    this.rippleRadius = AppValues.fixed4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(rippleRadius),
        highlightColor: rippleColor,
        onTap: onTap,
        child: child,
      ),
    );
  }
}
