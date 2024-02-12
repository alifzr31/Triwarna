import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:triwarna_rebuild/app/core/values/loading.dart';
import 'package:triwarna_rebuild/app/core/values/snackbars.dart';
import 'package:triwarna_rebuild/app/data/providers/forgot_password/resetpassword_provider.dart';

class ResetPasswordController extends GetxController {
  final ResetPasswordProvider resetPasswordProvider;

  ResetPasswordController({required this.resetPasswordProvider});

  final phoneNumber = Rx<String?>(null);
  final formKey = GlobalKey<FormState>().obs;
  final newPasswordController = TextEditingController().obs;
  final obscureNewPass = true.obs;
  final confirmPasswordController = TextEditingController().obs;
  final obscureConfirmPass = true.obs;

  @override
  void onInit() {
    phoneNumber.value = Get.arguments;
    super.onInit();
  }

  @override
  void onClose() {
    newPasswordController.value.dispose();
    confirmPasswordController.value.dispose();
    super.onClose();
  }

  void resetPassword() async {
    final formData = dio.FormData.fromMap({
      'value': phoneNumber.value,
      'password': newPasswordController.value.text,
      'password_confirmation': confirmPasswordController.value.text,
    });

    showLoading();

    try {
      final response = await resetPasswordProvider.resetPassword(formData);

      if (response.statusCode == 200) {
        showLoading();

        successSnackbar(
          'Reset Password Berhasil',
          response.data['message'],
        );
        Get.offAndToNamed('/login');
      }
    } on dio.DioException catch (e) {
      Get.back();
      failedSnackbar(
        'Reset Password Gagal',
        'Ups sepertinya terjadi kesalahan. code:${e.response?.statusCode}',
      );
    }
  }
}
