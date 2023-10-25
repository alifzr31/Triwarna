import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/core/values/snackbars.dart';
import 'package:triwarna_rebuild/app/data/models/detail_lottery.dart';
import 'package:triwarna_rebuild/app/data/providers/lottery_provider.dart';

class LotteryContoller extends GetxController {
  final LotteryProvider lotteryProvider;

  LotteryContoller({required this.lotteryProvider});

  final noTransaction = Rx<String?>(null);
  final detailLottery = <DetailLottery>[].obs;
  final isLoading = false.obs;

  @override
  void onClose() {
    detailLottery.clear();
    super.onClose();
  }

  Future<void> fetchDetailLottery() async {
    isLoading.value = true;
    try {
      final response =
          await lotteryProvider.fetchDetailLottery(noTransaction.value);
      final List<DetailLottery> body = response.data['data'] == null
          ? []
          : listDetailLotteryFromJson(jsonEncode(response.data['data']));

      detailLottery.value = body;
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        failedSnackbar('Load Detail Undian Gagal', 'Ups sepertinya terjadi kesalahan');
      }
    } finally {
      isLoading.value = false;
      update();
    }
  }

  Future<void> refreshDetailLottery() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {
      fetchDetailLottery();
    });
  }
}
