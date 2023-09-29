import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/data/providers/contents_provider.dart';
import 'package:triwarna_rebuild/app/modules/contents/controller.dart';

class ContentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContentsProvider>(() => ContentsProvider());
    Get.lazyPut<ContentsController>(() => ContentsController(contentsProvider: Get.find()));
  }
}