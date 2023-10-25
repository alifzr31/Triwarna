import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/data/providers/dashboard_provider.dart';
import 'package:triwarna_rebuild/app/modules/benefit/controller.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';

class BenefitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BenefitController>(() => BenefitController());

    Get.lazyPut<DashboardProvider>(() => DashboardProvider());
    Get.lazyPut<DashboardController>(() => DashboardController(dashboardProvider: Get.find()));
  }
}