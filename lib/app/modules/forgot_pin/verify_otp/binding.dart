import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/data/providers/dashboard_provider.dart';
import 'package:triwarna_rebuild/app/data/providers/forgot_pin/verifyotp_provider.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';
import 'package:triwarna_rebuild/app/modules/forgot_pin/verify_otp/controller.dart';

class VerifyOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyOtpProvider>(() => VerifyOtpProvider());
    Get.lazyPut<VerifyOtpController>(() => VerifyOtpController(verifyOtpProvider: Get.find()));

    Get.lazyPut<DashboardProvider>(() => DashboardProvider());
    Get.lazyPut<DashboardController>(() => DashboardController(dashboardProvider: Get.find()));
  }
}