import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:triwarna_rebuild/app/core/values/loading.dart';
import 'package:triwarna_rebuild/app/core/values/snackbars.dart';
import 'package:triwarna_rebuild/app/data/providers/register_provider.dart';

class RegisterController extends GetxController {
  final RegisterProvider registerProvider;

  RegisterController({required this.registerProvider});

  final formKey = GlobalKey<FormState>().obs;
  final namaController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;
  final showPass = true.obs;
  final showConfirmPass = true.obs;
  final loading = false.obs;

  @override
  void onClose() {
    namaController.value.dispose();
    emailController.value.dispose();
    passwordController.value.dispose();
    confirmPasswordController.value.dispose();
    super.onClose();
  }

  void register() async {
    final formData = dio.FormData.fromMap({
      'name': namaController.value.text,
      'email': emailController.value.text,
      'password': passwordController.value.text,
      'password_confirmation': confirmPasswordController.value.text,
    });

    showLoading();

    try {
      final response = await registerProvider.register(formData);

      if (response.data['verify'] == 0) {
        Get.back();
        successSnackbar('Register Berhasil',
            'Register sudah berhasil, silahkan verifikasi akun anda');
        Get.offAndToNamed('/verify', arguments: response.data['email']);
      }
    } on dio.DioException catch (e) {
      Get.back();
      if (e.response?.statusCode == 500) {
        failedSnackbar('Register Gagal', 'Ups sepertinya terjadi kesalahan');
      } else {
        if (e.response?.data['email'] != null) {
          infoSnackbar('Email Sudah Terdaftar', 'Silahkan gunakan email lain yang belum terdaftar');
        }
      }
    } finally {
      loading.value = false;
    }
  }
}
