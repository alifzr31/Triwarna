import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/data/providers/register_provider.dart';
import 'package:triwarna_rebuild/app/modules/auth/widgets/register/controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterProvider>(() => RegisterProvider());
    Get.lazyPut<RegisterController>(() => RegisterController(registerProvider: Get.find()));
  }
}