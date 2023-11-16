import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/data/providers/dashboard_provider.dart';
import 'package:triwarna_rebuild/app/data/providers/forgot_pin/sendotp_provider.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';
import 'package:triwarna_rebuild/app/modules/forgot_pin/send_otp/controller.dart';

class SendOtpBindning extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SendOtpProvider>(() => SendOtpProvider());
    Get.lazyPut<SendOtpController>(() => SendOtpController(sendOtpProvider: Get.find()));

    Get.lazyPut<DashboardProvider>(() => DashboardProvider());
    Get.lazyPut<DashboardController>(() => DashboardController(dashboardProvider: Get.find()));
  }
}