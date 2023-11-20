import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:triwarna_rebuild/app/core/values/loading.dart';
import 'package:triwarna_rebuild/app/core/values/snackbars.dart';
import 'package:triwarna_rebuild/app/data/providers/forgot_pin/resetpin_provider.dart';

class ResetPinController extends GetxController {
  final ResetPinProvider resetPinProvider;

  ResetPinController({required this.resetPinProvider});

  final pageController = PageController(initialPage: 0).obs;
  final currentPage = 0.obs;

  final title = [
    'Masukkan PIN Baru Anda',
    'Masukkan Konfirmasi PIN Anda',
  ].obs;

  final newPinDigits = List.filled(6, '').obs;
  final confirmPinDigits = List.filled(6, '').obs;
  final currentNewPinDigitIndex = 0.obs;
  final currentConfirmPinDigitIndex = 0.obs;

  final newPin = Rx<String?>(null);
  final confirmPin = Rx<String?>(null);
  final showAlert = false.obs;

  void nextPage() {
    pageController.value.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInCirc,
    );
  }

  void updateNewPinDigit(String digit) async {
    if (currentNewPinDigitIndex.value < 6) {
      newPinDigits[currentNewPinDigitIndex.value] = digit;
      currentNewPinDigitIndex.value++;
    }

    if (currentNewPinDigitIndex.value == 6) {
      newPin.value = newPinDigits.join();
      nextPage();
    }
  }

  void updateConfirmPinDigit(String digit) async {
    if (currentConfirmPinDigitIndex.value < 6) {
      confirmPinDigits[currentConfirmPinDigitIndex.value] = digit;
      currentConfirmPinDigitIndex.value++;
    }

    if (currentConfirmPinDigitIndex.value == 6) {
      confirmPin.value = confirmPinDigits.join();

      if (confirmPin.value != newPin.value) {
        showAlert.value = true;
      } else {
        showAlert.value = false;
        resetPin();
      }
    }
  }

  void deletePinDigit() {
    showAlert.value = false;
    if (currentPage.value == 0) {
      if (currentNewPinDigitIndex.value > 0) {
        currentNewPinDigitIndex.value--;
        newPinDigits[currentNewPinDigitIndex.value] = '';
      }
    }

    if (currentPage.value == 1) {
      if (currentConfirmPinDigitIndex.value > 0) {
        currentConfirmPinDigitIndex.value--;
        confirmPinDigits[currentConfirmPinDigitIndex.value] = '';
      }
    }
  }

  void resetPin() async {
    final formData = dio.FormData.fromMap({
      'pin_baru': newPin.value,
      'pin_konfirmasi': confirmPin.value,
    });

    showLoading();

    try {
      final response = await resetPinProvider.resetPin(formData);

      if (response.statusCode == 200) {
        Get.back();
        Get.back();
        successSnackbar(
          'Reset PIN Berhasil',
          'PIN anda berhasil di reset',
        );
      }
    } on DioException catch (e) {
      failedSnackbar(
        'Ups sepertinya terjadi kesalahan',
        'code:${e.response?.statusCode}',
      );
    }
  }
}
