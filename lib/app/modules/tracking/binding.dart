import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/data/providers/tracking_provider.dart';
import 'package:triwarna_rebuild/app/modules/tracking/controller.dart';

class TrackingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrackingProvider>(() => TrackingProvider());
    Get.lazyPut<TrackingController>(() => TrackingController(trackingProvider: Get.find()));
  }
}