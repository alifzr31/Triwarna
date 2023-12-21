import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/core/values/snackbars.dart';
import 'package:triwarna_rebuild/app/data/models/voucher.dart';
import 'package:triwarna_rebuild/app/data/providers/voucher_provider.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';

class VoucherController extends GetxController {
  final VoucherProvider voucherProvider;

  VoucherController({required this.voucherProvider});

  final currentTab = 0.obs;
  final voucherProgress = <Voucher>[].obs;
  final voucherComplete = <Voucher>[].obs;
  final isLoading = true.obs;
  final loyaltyLevel = Rx<String?>(null);

  @override
  void onInit() {
    final userController = Get.find<DashboardController>();
    if (userController.token.value != null) {
      if (userController.profile.value != null) {
        loyaltyLevel.value = userController.profile.value?.loyalty;
      }
    }
    fetchVoucher();
    super.onInit();
  }

  @override
  void onClose() {
    voucherProgress.clear();
    voucherComplete.clear();
    super.onClose();
  }

  Future<void> fetchVoucher() async {
    try {
      final response = await voucherProvider.fetchVoucher();
      final List<Voucher> body = response.data['data'] == null
          ? []
          : listVoucherFromJson(jsonEncode(response.data['data']));

      voucherProgress.value = body
          .where((e) => !e.statusHadiah!.status
              .toString()
              .toLowerCase()
              .trim()
              .contains('terima'))
          .toList();
      voucherComplete.value = body
          .where((e) => e.statusHadiah!.status
              .toString()
              .toLowerCase()
              .trim()
              .contains('terima'))
          .toList();
    } on DioException catch (e) {
      failedSnackbar(
        'Ups sepertinya terjadi kesalahan',
        'code:${e.response?.statusCode}',
      );
    } finally {
      isLoading.value = false;
      update();
    }
  }

  Future<void> refreshVoucher() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {
      isLoading.value = true;
      fetchVoucher();
    });
  }
}
