import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:triwarna_rebuild/app/core/values/app_helpers.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';

class BenefitController extends GetxController {
  final currentTab = 0.obs;
  final token = Rx<String?>(null);
  final loyaltyLevel = Rx<String?>(null);
  final total = 0.obs;
  final spendingTotal = Rx<String?>(null);
  final cardIndex = 0.obs;

  final termItems = [
    'Poin yang dapat ditukarkan dengan kelipatan 50',
    'Saldo yang diambil tidak boleh melebihi poin aktif Anda',
    'Batas waktu pencairan saldo adalah 1 bulan',
    'Apabila saldo yang sudah dicairkan tidak terpakai maka voucher tidak dapat digunakan (Hangus)',
    'Voucher yang hangus tidak akan mengembalikan poin Anda',
  ].obs;

  final questions = [
    'Saya sudah melakukan registrasi member triwarna, tetapi tidak bisa melakukan login?',
    'Poin member bisa digunakan untuk apa saja?',
    'Apakah bisa menukarkan poin di seluruh cabang triwarna?',
    'Saya mempunyai poin member, namun tidak dapat melakukan penukaran poin?',
  ].obs;

  @override
  void onInit() async {
    currentTab.value = Get.arguments == null ? 0 : Get.arguments['openedIndex'];
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
}
