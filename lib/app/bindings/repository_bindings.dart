import 'package:get/get.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<TuyaRepository>(
    //   () => TuyaRepositoryImpl(Get.find<TuyaRemoteDataSource>()),
    //   fenix: true,
    // );
   print('d');
  }
}
