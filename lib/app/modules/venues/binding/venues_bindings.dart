import 'package:fieldify/app/modules/venues/controller/venue_controller.dart';
import 'package:get/get.dart';

class VenueBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VenueController>(
      () => VenueController(),
      fenix: true,
    );
  }
}
