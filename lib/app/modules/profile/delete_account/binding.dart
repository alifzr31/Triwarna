import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/data/providers/auth_provider.dart';
import 'package:triwarna_rebuild/app/data/providers/dashboard_provider.dart';
import 'package:triwarna_rebuild/app/data/providers/profile_provider.dart';
import 'package:triwarna_rebuild/app/modules/auth/controller.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';
import 'package:triwarna_rebuild/app/modules/profile/delete_account/controller.dart';

class DeleteAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileProvider>(() => ProfileProvider());
    Get.lazyPut<DeleteAccountController>(
        () => DeleteAccountController(profileProvider: Get.find()));

    Get.lazyPut<DashboardProvider>(() => DashboardProvider());
    Get.lazyPut<DashboardController>(
        () => DashboardController(dashboardProvider: Get.find()));

    Get.lazyPut<AuthProvider>(() => AuthProvider());
    Get.lazyPut<AuthController>(() => AuthController(authProvider: Get.find()));
  }
}
