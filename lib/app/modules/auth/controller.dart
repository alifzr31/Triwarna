import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:triwarna_rebuild/app/core/values/loading.dart';
import 'package:triwarna_rebuild/app/core/values/snackbars.dart';
import 'package:triwarna_rebuild/app/data/providers/auth_provider.dart';

class AuthController extends GetxController {
  final AuthProvider authProvider;

  AuthController({required this.authProvider});

  final email = Rx<String?>(null);
  final verifyLoading = false.obs;
  final hasSent = false.obs;

  void verify() async {
    final formData = dio.FormData.fromMap({
      'email': email.value,
    });

    verifyLoading.value = true;

    try {
      await authProvider.verify(formData);
    } on dio.DioException catch (e) {
      Get.back();
      if (e.response?.statusCode == 500) {
        failedSnackbar('Verifikasi Gagal', 'Ups sepertinya terjadi kesalahan');
      }
    } finally {
      verifyLoading.value = false;
      hasSent.value = true;
    }
  }

  void logout() async {
    showLoading();

    try {
      await authProvider.logout();
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.clear();
      await sharedPreferences.setBool('opened', true);

      if (Get.currentRoute == '/deleteAccount') {
        infoSnackbar(
          'Hapus Akun Berhasil',
          'Akun anda berhasil dihapus dan anda berhenti sebagai anggota member. Terima kasih dan sampai jumpa',
        );
      } else {
        infoSnackbar(
          'Log Out Berhasil',
          'Anda sudah berhasil log out',
        );
      }
      Get.offAllNamed('/dashboard');
    } on dio.DioException catch (e) {
      Get.back();
      if (e.response?.statusCode == 500) {
        failedSnackbar('Log Out Gagal', 'Ups telah terjadi sesuatu');
      } else {
        infoSnackbar('Log Out Gagal', e.response?.data.toString() ?? '');
      }
    }
  }
}
