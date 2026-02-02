import 'dart:ui';

import '../utils/app_colors.dart';

class ValidationModel {
  final String message;
  final bool value;
  final Color color;

  ValidationModel(
      {required this.message, required this.value, required this.color});

  factory ValidationModel.fromMap(Map<String, dynamic> map) {
    return ValidationModel(
        message: map['message'] ?? '',
        value: map['value'] ?? false,
        color: map['color'] ?? AppColors.primaryBlue);
  }

  Map<String, dynamic> toMap() {
    return {'message': message, 'value': value, 'color': color};
  }

  @override
  String toString() {
    return 'ValidationResult(message: $message, value: $value $color)';
  }
}
