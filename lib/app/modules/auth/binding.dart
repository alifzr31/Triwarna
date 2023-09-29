import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/data/providers/auth_provider.dart';
import 'package:triwarna_rebuild/app/modules/auth/controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthProvider>(() => AuthProvider());
    Get.lazyPut<AuthController>(() => AuthController(authProvider: Get.find()));
  }
}
