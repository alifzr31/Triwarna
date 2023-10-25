import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/modules/update_apps/controller.dart';

class UpdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateController>(() => UpdateController());
  }
}