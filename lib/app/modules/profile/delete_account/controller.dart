import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:triwarna_rebuild/app/core/values/app_helpers.dart';
import 'package:triwarna_rebuild/app/core/values/loading.dart';
import 'package:triwarna_rebuild/app/core/values/snackbars.dart';
import 'package:triwarna_rebuild/app/data/providers/profile_provider.dart';
import 'package:triwarna_rebuild/app/modules/auth/controller.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';

class DeleteAccountController extends GetxController {
  final ProfileProvider profileProvider;

  DeleteAccountController({required this.profileProvider});

  final userController = Get.find<DashboardController>();
  final authController = Get.find<AuthController>();

  final sent = false.obs;
  final email = Rx<String?>(null);

  final formKey = GlobalKey<FormState>().obs;
  final otpController = TextEditingController().obs;

  @override
  void onInit() {
    final maskedEmail =
        AppHelpers.maskEmail(userController.profile.value?.email ?? '');
    email.value = maskedEmail;
    super.onInit();
  }

  @override
  void onClose() {
    email.value = null;
    sent.value = false;
    otpController.value.dispose();
    super.onClose();
  }

  void deleteAccountOtp() async {
    showLoading();

    try {
      final response = await profileProvider.deleteAccountOtp();

      if (response.statusCode == 200) {
        Get.back();
        sent.value = true;
      }
    } on DioException catch (e) {
      Get.back();
      failedSnackbar(
        'Ups sepertinya terjadi kesalahan',
        'code:${e.response?.statusCode}',
      );
    }
  }

  void deleteAccount() async {
    final formData = dio.FormData.fromMap({
      'otp': otpController.value.text,
    });

    showLoading();

    try {
      final response = await profileProvider.deleteAccount(formData);

      if (response.statusCode == 200) {
        Get.back();
        authController.logout();
      }
    } on DioException catch (e) {
      Get.back();
      print(e.response?.statusCode);
      if (e.response?.statusCode == 422) {
        infoSnackbar(
          e.response?.data['message'],
          'Silahkan cek kembali otp yang ada di email anda',
        );
      } else {
        failedSnackbar(
          'Ups sepertinya terjadi kesalahan',
          'code:${e.response?.statusCode}',
        );
      }
    }
  }
}
