import 'package:shared_preferences/shared_preferences.dart';

class AppPrefs {
  static const String isLogIn = 'isLogIn';
  static const String email = 'email';
  static const String name = 'name';
  static const String isOnBoardingShown = 'isOnBoardingShown';
  static const String password = 'password';
  static const String rememberMe = 'rememberMe';
  static const String id = 'id';
  static const String imageUrl = 'imageUrl';
  static const String joiningDate = 'joiningDate';
  static const String isAdmin = 'isAdmin';
  static const String isDarkMode = 'isDarkMode';
  static const String appLocale = 'appLocale';
}

class Preferences {
  Preferences._();

  static final Preferences _instance = Preferences._();
  static SharedPreferences? prefs;

  factory Preferences() {
    return _instance;
  }

  Future<void> initializePrefs() async {
    prefs ??= await SharedPreferences.getInstance();
  }
}
