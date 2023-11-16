import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/data/providers/forgot_pin/resetpin_provider.dart';
import 'package:triwarna_rebuild/app/modules/forgot_pin/reset_pin/controller.dart';

class ResetPinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPinProvider>(() => ResetPinProvider());
    Get.lazyPut<ResetPinController>(() => ResetPinController(resetPinProvider: Get.find()));
  }
}