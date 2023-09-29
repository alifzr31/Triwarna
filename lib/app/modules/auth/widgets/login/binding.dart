import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/data/providers/login_provider.dart';
import 'package:triwarna_rebuild/app/modules/auth/widgets/login/controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginProvider>(() => LoginProvider());
    Get.lazyPut<LoginController>(() => LoginController(loginProvider: Get.find()));
  }
}