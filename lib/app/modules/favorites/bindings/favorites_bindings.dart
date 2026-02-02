import 'package:fieldify/app/modules/favorites/controller/favorites_controller.dart';
import 'package:get/get.dart';

class FavoritesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoritesController>(() => FavoritesController());
  }
}
