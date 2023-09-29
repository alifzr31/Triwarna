import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/data/providers/lottery_provider.dart';
import 'package:triwarna_rebuild/app/modules/detail_lottery/controller.dart';

class LotteryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LotteryProvider>(() => LotteryProvider());
    Get.lazyPut<LotteryContoller>(() => LotteryContoller(lotteryProvider: Get.find()));
  }
}