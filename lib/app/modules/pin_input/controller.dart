import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/core/values/loading.dart';
import 'package:triwarna_rebuild/app/core/values/snackbars.dart';
import 'package:triwarna_rebuild/app/data/models/prize.dart';
import 'package:triwarna_rebuild/app/data/providers/pin_input_provider.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';
import 'package:triwarna_rebuild/app/modules/pin_input/components/success_redeem.dart';

class PinInputController extends GetxController {
  final PinInputProvider pinInputProvider;

  PinInputController({required this.pinInputProvider});

  final userController = Get.find<DashboardController>();

  final prize = Rx<Prize?>(null);
  final seletedStore = Rx<String?>(null);
  final storeName = Rx<String?>(null);
  final pinDigits = List.filled(6, '').obs;
  final currentDigitIndex = 0.obs;
  final visible = false.obs;

  final canVibrate = true.obs;

  @override
  void onInit() {
    vibrateCheck();
    prize.value = Get.arguments['prize'];
    seletedStore.value = Get.arguments['storeCode'];
    storeName.value = Get.arguments['storeName'];
    super.onInit();
  }

  void redeemPoint(BuildContext context, String prizeCode) async {
    final formData = dio.FormData.fromMap({
      'prize_code': prizeCode,
      'branch_code': seletedStore.value,
    });

    showLoading();

    try {
      final response = await pinInputProvider.redeemPoint(formData);

      if (response.statusCode == 200) {
        Get.back();
        successRedeem(
          context,
          prize.value?.prizeDesc ?? '',
          prize.value?.point ?? '',
          storeName.value ?? '',
        );
      }
    } on dio.DioException catch (e) {
      Get.back();
      failedSnackbar(
        'Tukar Poin Gagal',
        'Ups sepertinya terjadi kesalahan. code:${e.response?.statusCode}',
      );
    }
  }

  Future<void> vibrateCheck() async {
    final check = await Vibrate.canVibrate;
    canVibrate.value = check;
  }

  void updatePinDigit(BuildContext context, String digit) async {
    if (currentDigitIndex.value < 6) {
      pinDigits[currentDigitIndex.value] = digit;
      currentDigitIndex.value++;
    }

    if (currentDigitIndex.value == 6) {
      final pin = pinDigits.join().obs;
      if (pin.value == userController.profile.value?.pin) {
        visible.value = false;

        redeemPoint(context, prize.value?.prizeCode ?? '');
      } else {
        visible.value = true;
        if (canVibrate.value) {
          Vibrate.feedback(FeedbackType.error);
        }
      }
    }
  }

  void deletePinDigit() {
    if (currentDigitIndex.value > 0) {
      currentDigitIndex.value--;
      pinDigits[currentDigitIndex.value] = '';
    }

    visible.value = false;
  }
}
