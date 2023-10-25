import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:triwarna_rebuild/app/core/values/snackbars.dart';
import 'package:triwarna_rebuild/app/data/models/point.dart';
import 'package:triwarna_rebuild/app/data/models/prize.dart';
import 'package:triwarna_rebuild/app/data/providers/point_provider.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';

class PointController extends GetxController {
  final PointProvider pointProvider;

  PointController({required this.pointProvider});

  final lastPoint = Rx<String?>(null);
  final lastTransaction = Rx<String?>(null);
  final point = <Point>[].obs;
  final pointLoading = true.obs;

  final searchPrize = Rx<String?>(null);
  final prize = <Prize>[].obs;
  final filteredPrize = <Prize>[].obs;
  final prizeLoading = true.obs;

  final completeProfile = Rx<bool?>(null);

  final spendingTotal = 0.obs;
  final totalTransaction = Rx<String?>(null);
  final date = Rx<String?>(null);

  @override
  void onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    completeProfile.value = sharedPreferences.getBool('complete');
    final userController = Get.find<DashboardController>();

    if (userController.token.value != null) {
      if (userController.profile.value != null) {
        spendingTotal.value = int.parse(userController.profile.value?.spendingTotal ?? '0');
        totalTransaction.value = NumberFormat.currency(
          locale: 'id_ID',
          symbol: 'Rp ',
        ).format(spendingTotal.value);
      }
    }

    await fetchPoint();
    await fetchPrize();
    super.onInit();
  }

  @override
  void onClose() {
    point.clear();
    prize.clear();
    super.onClose();
  }

  Future<void> fetchPoint() async {
    try {
      final response = await pointProvider.fetchPoint();
      lastPoint.value = response.data['point']['last_point'];
      lastTransaction.value = response.data['last_transaction'];
      final List<Point> body = response.data['point_history'] == null
          ? []
          : listPointFromJson(jsonEncode(response.data['point_history']));

      point.value = body;
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        failedSnackbar('Load Point Gagal', 'Ups sepertinya terjadi kesalahan');
      }
    } finally {
      pointLoading.value = false;
      update();
    }
  }

  Future<void> fetchPrize() async {
    try {
      final response = await pointProvider.fetchPrize();
      final List<Prize> body = response.data['data'] == null
          ? []
          : listPrizeFromJson(jsonEncode(response.data['data']));

      prize.value = body;
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        failedSnackbar('Load Hadiah Gagal', 'Ups sepertinya terjadi kesalahan');
      }
    } finally {
      prizeLoading.value = false;
      update();
    }
  }

  Future<void> refreshPoint() async {
    await Future.delayed(const Duration(milliseconds: 2500), () async {
      pointLoading.value = true;
      prizeLoading.value = true;
      await fetchPoint();
      await fetchPrize();
    });
  }

  Future<void> refreshPrize() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {
      prizeLoading.value = true;
      fetchPrize();
    });
  }
}
