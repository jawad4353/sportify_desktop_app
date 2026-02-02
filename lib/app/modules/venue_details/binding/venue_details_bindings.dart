import 'package:fieldify/app/modules/venue_details/controller/venue_details_controller.dart';
import 'package:get/get.dart';

class VenueDetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VenueDetailsController>(
      () => VenueDetailsController(),
      fenix: true,
    );
  }
}
