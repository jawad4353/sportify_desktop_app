import 'package:fieldify/app/modules/boarding/bindings/on_boarding_bindings.dart';
import 'package:fieldify/app/modules/boarding/view/boarding_view.dart';
import 'package:fieldify/app/modules/bookings/widgets/add_review_screen.dart';
import 'package:fieldify/app/modules/dashboard/binding/dashboard_bindings.dart';
import 'package:fieldify/app/modules/dashboard/view/dashboard_view.dart';
import 'package:fieldify/app/modules/favorites/bindings/favorites_bindings.dart';
import 'package:fieldify/app/modules/favorites/view/favorites_view.dart';
import 'package:fieldify/app/modules/login/binding/login_bindings.dart';
import 'package:fieldify/app/modules/login/view/login_view.dart';
import 'package:fieldify/app/modules/notifications/bindings/notifications_bindings.dart';
import 'package:fieldify/app/modules/notifications/view/notifications_view.dart';
import 'package:fieldify/app/modules/register/bindings/register_bindings.dart';
import 'package:fieldify/app/modules/register/view/register_view.dart';
import 'package:fieldify/app/modules/reset_password/binding/reset_password_bindings.dart';
import 'package:fieldify/app/modules/reset_password/view/reset_password_view.dart';
import 'package:fieldify/app/modules/venue_details/binding/venue_details_bindings.dart';
import 'package:fieldify/app/modules/venue_details/view/venue_details_view.dart';
import 'package:fieldify/app/modules/venue_details/widgets/rules_and_regulations_screen.dart';
import 'package:get/get.dart';

import '/app/modules/splash/bindings/splash_binding.dart';
import '/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.BOARDING,
      page: () => BoardingView(),
      binding: BoardingBindings(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBindings(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => ResetPasswordView(),
      binding: ResetPasswordBindings(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBindings(),
    ),
    GetPage(
      name: _Paths.VENUE_DETAILS,
      page: () => VenueDetailsView(),
      binding: VenueDetailsBindings(),
    ),
    GetPage(
      name: _Paths.NOTIFICATIONS,
      page: () => NotificationsView(),
      binding: NotificationsBindings(),
    ),
    GetPage(
      name: _Paths.FAVORITE,
      page: () => FavoritesView(),
      binding: FavoritesBindings(),
    ),
    GetPage(
      name: _Paths.RULES_AND_REGULATIONS,
      page: () => const RulesAndRegulationsScreen(),
    ),
    GetPage(
      name: _Paths.ADD_REVIEW,
      page: () => AddReviewScreen(),
    ),
  ];
}
