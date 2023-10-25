import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:triwarna_rebuild/app/core/values/loading.dart';
import 'package:triwarna_rebuild/app/core/values/snackbars.dart';
import 'package:triwarna_rebuild/app/data/providers/login_provider.dart';

class LoginController extends GetxController {
  final LoginProvider loginProvider;

  LoginController({required this.loginProvider});

  final formKey = GlobalKey<FormState>().obs;
  final usernameController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final showPass = true.obs;
  final loading = false.obs;

  @override
  void onClose() {
    usernameController.value.dispose();
    passwordController.value.dispose();
    super.onClose();
  }

  void login() async {
    final formData = dio.FormData.fromMap({
      'username': usernameController.value.text,
      'password': passwordController.value.text,
    });

    print(formData.fields);

    loading.value = true;

    showLoading();

    try {
      final response = await loginProvider.login(formData);
      if (response.data['verify'] == '0') {
        Get.back();
        infoSnackbar('Akun Belum Aktif', 'Silahkan verifikasi email untuk mengaktifkan akun anda');
        Get.offAndToNamed('/verify', arguments: response.data['email']);
      } else {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString('token', response.data['token']);

        successSnackbar('Log In Berhasil', response.data['message']);
        Get.offAllNamed('/dashboard');
      }
    } on dio.DioException catch (e) {
      Get.back();
      if (e.response?.statusCode == 500) {
        failedSnackbar('Log In Gagal', 'Ups sepertinya terjadi kesalahan');
      } else {
        infoSnackbar('Log In Gagal', e.response?.data['message']);
      }
    } finally {
      loading.value = false;
    }
  }
}