import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/core/values/snackbars.dart';
import 'package:triwarna_rebuild/app/data/models/detail_shoppinghistory.dart';
import 'package:triwarna_rebuild/app/data/models/shopping_history.dart';
import 'package:triwarna_rebuild/app/data/providers/shopping_provider.dart';

class ShoppingController extends GetxController {
  final ShoppingProvider shoppingProvider;

  ShoppingController({required this.shoppingProvider});

  final shoppingHistory = <ShoppingHistory>[].obs;
  final shoppingHistoryLoading = true.obs;

  final docnum = Rx<String?>(null);
  final detailShoppingHistory = <DetailShoppingHistory>[].obs;
  final detailShoppingHistoryLoading = false.obs;

  @override
  void onInit() {
    fetchShoppingHistory();
    super.onInit();
  }

  @override
  void onClose() {
    shoppingHistory.clear();
    super.onClose();
  }

  Future<void> fetchShoppingHistory() async {
    try {
      final response = await shoppingProvider.fetchShoppingHistory();
      final List<ShoppingHistory> body = response.data['data'] == null
          ? []
          : listShoppingHistoryFromJson(jsonEncode(response.data['data']));

      shoppingHistory.value = body;
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        failedSnackbar(
            'Load Riwayat Belanja Gagal', 'Ups sepertinya terjadi kesalahan');
      }
    } finally {
      shoppingHistoryLoading.value = false;
      update();
    }
  }

  Future<void> fetchDetailShoppingHistory() async {
    detailShoppingHistoryLoading.value = true;

    try {
      final response =
          await shoppingProvider.fetchDetailShoppingHistory(docnum.value);
      final List<DetailShoppingHistory> body = response.data['data'] == null
          ? []
          : listDetailShoppingHistoryFromJson(
              jsonEncode(response.data['data']));

      detailShoppingHistory.value = body;
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        failedSnackbar('Load Detail Riwayat Belanja Gagal',
            'Ups sepertinya terjadi kesalahan');
      }
    } finally {
      detailShoppingHistoryLoading.value = false;
      update();
    }
  }

  Future<void> refreshShoppingHistory() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {
      fetchShoppingHistory();
    });
  }
}
