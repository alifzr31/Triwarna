import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/core/values/snackbars.dart';
import 'package:triwarna_rebuild/app/data/models/tracking.dart';
import 'package:triwarna_rebuild/app/data/models/voucher.dart';
import 'package:triwarna_rebuild/app/data/providers/voucher_provider.dart';

class VoucherController extends GetxController {
  final VoucherProvider voucherProvider;

  VoucherController({required this.voucherProvider});

  final voucher = <Voucher>[].obs;
  final voucherLoading = true.obs;

  final serialNumber = Rx<String?>(null);
  final tracking = <Tracking>[].obs;
  final trackingLoading = false.obs;

  @override
  void onInit() {
    fetchVoucher();
    super.onInit();
  }

  @override
  void onClose() {
    voucher.clear();
    tracking.clear();
    super.onClose();
  }

  Future<void> fetchVoucher() async {
    try {
      final response = await voucherProvider.fetchVoucher();
      final List<Voucher> body = response.data['data'] == null
          ? []
          : listVoucherFromJson(jsonEncode(response.data['data']));

      voucher.value = body;
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        failedSnackbar(
            'Load Voucher Gagal', 'Ups sepertinya terjadi kesalahan');
      }
    } finally {
      voucherLoading.value = false;
      update();
    }
  }

  Future<void> fetchTracking() async {
    trackingLoading.value = true;

    try {
      final response = await voucherProvider.fetchTracking(serialNumber.value);
      final List<Tracking> body = response.data['data'] == null
          ? []
          : listTrackingFromJson(jsonEncode(response.data['data']));

      tracking.value = body;
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        failedSnackbar(
            'Load Lacak Hadiah Gagal', 'Ups sepertinya terjadi kesalahan');
      }
    } finally {
      trackingLoading.value = false;
      update();
    }
  }

  Future<void> refreshVoucher() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {
      fetchVoucher();
    });
  }
}
