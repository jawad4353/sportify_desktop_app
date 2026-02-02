import 'package:fieldify/app/core/base/base_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../bookings/view/bookings_view.dart';
import '../../home/view/home_view.dart';
import '../../refunds/view/refunds_view.dart';
import '../../settings/view/settings_view.dart';
import '../../venues/view/venue_view.dart';

class DashboardController extends BaseController {
  final selectedIndex = 0.obs;

  final List<Widget> screens = [
    HomeView(),
    VenueView(),
    BookingsView(),
    RefundsView(),
    SettingsView(),
  ];
}
