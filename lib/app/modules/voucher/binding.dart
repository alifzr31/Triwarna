import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/data/providers/voucher_provider.dart';
import 'package:triwarna_rebuild/app/modules/voucher/controller.dart';

class VoucherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VoucherProvider>(() => VoucherProvider());
    Get.lazyPut<VoucherController>(() => VoucherController(voucherProvider: Get.find()));
  }
}