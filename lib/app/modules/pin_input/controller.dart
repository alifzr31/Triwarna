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

  final canVibrate = true.obs;
  final enteredPin = ''.obs;
  final hasError = false.obs;

  @override
  void onInit() {
    vibrateCheck();
    prize.value = Get.arguments['prize'];
    seletedStore.value = Get.arguments['storeCode'];
    storeName.value = Get.arguments['storeName'];
    super.onInit();
  }

  void enterPin(BuildContext context, int number) async {
    hasError.value = false;
    if (enteredPin.value.length < 6) {
      enteredPin.value += number.toString();
    }

    if (enteredPin.value.length == 6) {
      if (enteredPin.value == userController.profile.value?.pin) {
        hasError.value = false;

        redeemPoint(context, prize.value?.prizeCode ?? '');
      } else {
        hasError.value = true;
        enteredPin.value = '';
        if (canVibrate.value) {
          Vibrate.feedback(FeedbackType.error);
        }
      }
    }
  }

  void deletePin() {
    hasError.value = false;
    if (enteredPin.value.isNotEmpty) {
      enteredPin.value =
          enteredPin.value.substring(0, enteredPin.value.length - 1);
    }
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
}
