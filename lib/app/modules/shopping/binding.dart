import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/data/providers/shopping_provider.dart';
import 'package:triwarna_rebuild/app/modules/shopping/controller.dart';

class ShoppingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShoppingProvider>(() => ShoppingProvider());
    Get.lazyPut<ShoppingController>(() => ShoppingController(shoppingProvider: Get.find()));
  }
}