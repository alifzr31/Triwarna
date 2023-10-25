import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/data/providers/dashboard_provider.dart';
import 'package:triwarna_rebuild/app/data/providers/pin_input_provider.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';
import 'package:triwarna_rebuild/app/modules/pin_input/controller.dart';

class PinInputBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PinInputProvider>(() => PinInputProvider());
    Get.lazyPut<PinInputController>(() => PinInputController(pinInputProvider: Get.find()));

    Get.lazyPut<DashboardProvider>(() => DashboardProvider());
    Get.lazyPut<DashboardController>(() => DashboardController(dashboardProvider: Get.find()));
  }
}