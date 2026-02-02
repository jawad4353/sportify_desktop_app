import 'package:fieldify/app/modules/bookings/controller/bookings_controller.dart';
import 'package:get/get.dart';

class BookingsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookingsController>(
      () => BookingsController(),
      fenix: true,
    );
  }
}
