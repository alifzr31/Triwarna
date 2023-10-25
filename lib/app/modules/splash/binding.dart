import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/modules/splash/controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}