import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/modules/answer_faq/controller.dart';

class AnswerFaqBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnswerFaqController>(() => AnswerFaqController());
  }
}