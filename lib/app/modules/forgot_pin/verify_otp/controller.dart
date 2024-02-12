import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:triwarna_rebuild/app/core/values/app_helpers.dart';
import 'package:triwarna_rebuild/app/core/values/loading.dart';
import 'package:triwarna_rebuild/app/core/values/snackbars.dart';
import 'package:triwarna_rebuild/app/data/providers/forgot_pin/verifyotp_provider.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';

class VerifyOtpController extends GetxController {
  final VerifyOtpProvider verifyOtpProvider;

  VerifyOtpController({required this.verifyOtpProvider});

  final userController = Get.find<DashboardController>();

  final email = Rx<String?>(null);
  final noTelp = Rx<String?>(null);
  final type = Rx<String?>(null);
  final formKey = GlobalKey<FormState>().obs;
  final otpController = TextEditingController().obs;
  final showAlert = false.obs;
  final tunggu = false.obs;

  @override
  void onInit() {
    email.value =
        AppHelpers.maskEmail(userController.profile.value?.email ?? '');
    noTelp.value =
        AppHelpers.maskPhoneNumber(userController.profile.value?.contact ?? '');
    type.value = Get.arguments['type'];
    super.onInit();
  }

  @override
  void onClose() {
    otpController.value.dispose();
    super.onClose();
  }

  void verifyOtp() async {
    final formData = dio.FormData.fromMap({
      'type': type.value,
      'otp': otpController.value.text,
    });

    showLoading();

    try {
      final response = await verifyOtpProvider.verifyOtp(formData);

      if (response.statusCode == 200) {
        Get.back();
        showAlert.value = false;
        Get.offAndToNamed(
          '/resetPin',
          arguments: {
            'type': type.value,
          },
        );
      }
    } on dio.DioException catch (e) {
      Get.back();
      if (e.response?.statusCode == 422) {
        infoSnackbar(
          'Verifikasi OTP Gagal',
          e.response?.data['message'],
        );
      } else {
        failedSnackbar(
          'Ups sepertinya terjadi kesalahan',
          'code:${e.response?.statusCode}',
        );
      }
    }
  }

  void resendOtp() async {
    final formData = dio.FormData.fromMap({
      'type': type.value,
    });

    showLoading();

    try {
      final response = await verifyOtpProvider.resendOtp(formData);

      if (response.statusCode == 200) {
        Get.back();

        if (response.data['tunggu'] == null ||
            response.data['tunggu'] == false) {
          infoSnackbar(
            'Kirim Ulang Berhasil',
            'Kode OTP sudah dikirim ulang. Silahkan cek email anda',
          );
        } else {
          tunggu.value = response.data['tunggu'] ?? false;
          infoSnackbar(
            'Kode OTP Masih Aktif',
            response.data['message'],
          );
        }
      }
    } on dio.DioException catch (e) {
      Get.back();
      failedSnackbar(
        'Ups sepertinya terjadi kesalahan',
        'code:${e.response?.statusCode}',
      );
    }
  }
}
