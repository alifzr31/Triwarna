import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_button.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/core/values/loading.dart';
import 'package:triwarna_rebuild/app/core/values/snackbars.dart';
import 'package:triwarna_rebuild/app/data/models/prize.dart';
import 'package:triwarna_rebuild/app/data/providers/pin_input_provider.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';

class PinInputController extends GetxController {
  final PinInputProvider pinInputProvider;

  PinInputController({required this.pinInputProvider});

  final userController = Get.find<DashboardController>();

  final prize = Rx<Prize?>(null);
  final pinDigits = List.filled(6, '').obs;
  final currentDigitIndex = 0.obs;
  final visible = false.obs;

  @override
  void onInit() {
    prize.value = Get.arguments == null ? null : Get.arguments;
    super.onInit();
  }

  void redeemPoint(BuildContext context, String prizeCode) async {
    final formData = dio.FormData.fromMap({
      'prize_code': prizeCode,
    });

    showLoading();

    try {
      final response = await pinInputProvider.redeemPoint(formData);

      if (response.statusCode == 200) {
        Get.back();
        AwesomeDialog(
          context: context,
          animType: AnimType.scale,
          dialogType: DialogType.success,
          dismissOnTouchOutside: false,
          dismissOnBackKeyPress: false,
          headerAnimationLoop: true,
          padding: const EdgeInsets.all(10),
          body: Column(
            children: [
              const BaseText(
                text: 'Tukan Poin Berhasil',
                size: 20,
                bold: FontWeight.w500,
              ),
              const SizedBox(height: 10),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: [
                    const TextSpan(text: 'Selamat anda mendapatkan '),
                    TextSpan(
                      text: '${prize.value?.prizeDesc} ',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const TextSpan(text: 'dengan menukarkan '),
                    TextSpan(
                      text: '${prize.value?.point} poin',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          btnOk: BaseButton(
            bgColor: purpleColor,
            fgColor: Colors.white,
            label: 'Ok',
            onPressed: () {
              Get.offAllNamed('/dashboard');
            },
          ),
        ).show();
      }
    } on dio.DioException catch (e) {
      Get.back();
      if (e.response?.statusCode == 500) {
        failedSnackbar('Tukar Poin Gagal', 'Ups sepertinya terjadi kesalahan');
      }
    }
  }

  void updatePinDigit(BuildContext context, String digit) async {
    if (currentDigitIndex.value < 6) {
      pinDigits[currentDigitIndex.value] = digit;
      currentDigitIndex.value++;
    }

    if (currentDigitIndex.value == 6) {
      String pin = pinDigits.join();
      if (pin == userController.profile.value?.pin) {
        visible.value = false;

        redeemPoint(context, prize.value?.prizeCode ?? '');
      } else {
        visible.value = true;
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
