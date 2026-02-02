import 'package:flutter/services.dart';

class AppConstants {
  //regrex
  static final FilteringTextInputFormatter emailFormatter =
      FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9_\-@.]*$'));
  static final FilteringTextInputFormatter nameFormatter =
      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z - ]'));
  static final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  static final RegExp passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
  );
  static final RegExp nameRegex =
      RegExp(r"^[A-Za-z][A-Za-z'-]*(?: [A-Za-z][A-Za-z'-]*){0,2}$");

  static final FilteringTextInputFormatter idFormatter =
      FilteringTextInputFormatter.allow(RegExp(r'[0-9a-zA-Z]'));

  //login

}
