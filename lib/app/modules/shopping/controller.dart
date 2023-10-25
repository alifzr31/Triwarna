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
  final date = Rx<String?>(null);
  final total = Rx<String?>(null);
  final shoppingDetail = <ShoppingDetail>[].obs;
  final shoppingDetailLoading = false.obs;

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

  Future<void> fetchShoppingDetail() async {
    shoppingDetailLoading.value = true;

    try {
      final response =
          await shoppingProvider.fetchShoppingDetail(docnum.value);
      final List<ShoppingDetail> body = response.data['data'] == null
          ? []
          : listShoppingDetailFromJson(
              jsonEncode(response.data['data']));

      shoppingDetail.value = body;
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        failedSnackbar('Load Detail Riwayat Belanja Gagal',
            'Ups sepertinya terjadi kesalahan');
      }
    } finally {
      shoppingDetailLoading.value = false;
      update();
    }
  }

  Future<void> refreshShoppingHistory() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {
      shoppingHistoryLoading.value = true;
      fetchShoppingHistory();
    });
  }
}
