import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:triwarna_rebuild/app/core/values/app_helpers.dart';
import 'package:triwarna_rebuild/app/core/values/gradients.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';

class BenefitController extends GetxController {
  final currentTab = 0.obs;
  final token = Rx<String?>(null);
  final loyaltyLevel = Rx<String?>(null);
  final total = 0.obs;
  final spendingTotal = Rx<String?>(null);
  final cardIndex = 0.obs;

  @override
  void onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final userController = Get.find<DashboardController>();
    token.value = sharedPreferences.getString('token');

    if (token.value != null) {
      if (userController.profile.value != null) {
        loyaltyLevel.value = userController.profile.value?.loyalty;
        total.value =
            int.parse(userController.profile.value?.spendingTotal ?? '0');
        spendingTotal.value = AppHelpers.rupiahFormat(total.value);
      }
    }
    super.onInit();
  }

  final level = [
    'Silver',
    'Gold',
    'Platinum',
  ].obs;

  final barColor = [
    GradientColor.silver,
    GradientColor.gold,
    GradientColor.platinum,
  ];
}
