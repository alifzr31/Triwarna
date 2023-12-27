import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/data/providers/verify_provider.dart';
import 'package:triwarna_rebuild/app/modules/auth/widgets/verify/controller.dart';

class VerifyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyProvider>(() => VerifyProvider());
    Get.lazyPut<VerifyController>(() => VerifyController(verifyProvider: Get.find()));
  }
}