import 'package:fieldify/app/modules/bookings/binding/bookings_bindings.dart';
import 'package:fieldify/app/modules/dashboard/controller/dashboard_controller.dart';
import 'package:fieldify/app/modules/home/binding/home_bindings.dart';
import 'package:fieldify/app/modules/refunds/binding/refunds_bindings.dart';
import 'package:fieldify/app/modules/settings/binding/settings_bindings.dart';
import 'package:fieldify/app/modules/venues/binding/venues_bindings.dart';
import 'package:get/get.dart';

class DashboardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
      fenix: true,
    );
    HomeBindings().dependencies();
    VenueBindings().dependencies();
    BookingsBindings().dependencies();
    RefundsBindings().dependencies();
    SettingsBindings().dependencies();
  }
}
