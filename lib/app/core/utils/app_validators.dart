// import 'package:get/get.dart';
//
// import '../model/validator_model.dart';
// import 'app_constants.dart';
//
// class Validators {
//   static ValidationModel validateEmail(String value) {
//     RegExp regExp = RegExp(r'^[a-zA-Z0-9._%+-]+@mail\.bcu\.ac\.uk$');
//     bool isValid = regExp.hasMatch(value);
//
//     return ValidationModel.fromMap({
//       'message': isValid ? AppConstants.empty : AppConstants.invalidEmail.tr,
//       'value': isValid,
//     });
//   }
//
//   static ValidationModel validatePassword(String value) {
//     if (value.trim().isEmpty || value.trim().length < 6) {
//       return ValidationModel.fromMap({
//         'message': AppConstants.invalidPassword.tr,
//         'value': false,
//       });
//     }
//     return ValidationModel.fromMap({
//       'message': AppConstants.empty,
//       'value': true,
//     });
//   }
//
//   static ValidationModel validateName(String value) {
//     if (value.trim().isEmpty || value.trim().length < 2) {
//       return ValidationModel.fromMap({
//         'message': AppConstants.invalidName.tr,
//         'value': true,
//       });
//     }
//     return ValidationModel.fromMap({
//       'message': AppConstants.empty,
//       'value': true,
//     });
//   }
//
//   static ValidationModel validateId(String value) {
//     RegExp regExp = RegExp(r'^S\d{8}$');
//
//     if (value.isEmpty || !regExp.hasMatch(value)) {
//       return ValidationModel.fromMap({
//         'message': AppConstants.invalidId.tr,
//         'value': false,
//       });
//     }
//
//     return ValidationModel.fromMap({
//       'message': AppConstants.empty,
//       'value': true,
//     });
//   }
// }
