import 'package:fieldify/app/core/utils/app_text_styles.dart';
import 'package:flutter/cupertino.dart';

class ValidationTextMessage extends StatelessWidget {
  final Color color;
  final String message;

  const ValidationTextMessage({required this.message, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: AppTextStyles.robotoFourteen.copyWith(color: color),
    );
  }
}
