part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const SPLASH = _Paths.SPLASH;
  static const FAVORITE = _Paths.FAVORITE;
  static const BOARDING = _Paths.BOARDING;
  static const LOGIN = _Paths.LOGIN;
  static const RESET_PASSWORD = _Paths.RESET_PASSWORD;
  static const HOME = _Paths.HOME;
  static const REGISTER = _Paths.REGISTER;
  static const DASHBOARD = _Paths.DASHBOARD;
  static const VENUE_DETAILS = _Paths.VENUE_DETAILS;
  static const NOTIFICATIONS = _Paths.NOTIFICATIONS;
  static const RULES_AND_REGULATIONS = _Paths.RULES_AND_REGULATIONS;
  static const ADD_REVIEW = _Paths.ADD_REVIEW;
}

abstract class _Paths {
  static const SPLASH = '/splash';
  static const FAVORITE = '/favorite';
  static const BOARDING = '/boarding';
  static const LOGIN = '/login';
  static const RESET_PASSWORD = '/reset-password';
  static const HOME = '/home';
  static const REGISTER = '/register';
  static const DASHBOARD = '/dashboard';
  static const VENUE_DETAILS = '/venue-details';
  static const NOTIFICATIONS = '/notifications';
  static const RULES_AND_REGULATIONS = '/rules-and-regulations';
  static const ADD_REVIEW = '/add-review';
}
