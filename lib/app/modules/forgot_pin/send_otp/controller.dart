import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/core/values/app_helpers.dart';
import 'package:triwarna_rebuild/app/core/values/loading.dart';
import 'package:triwarna_rebuild/app/core/values/snackbars.dart';
import 'package:triwarna_rebuild/app/data/providers/forgot_pin/sendotp_provider.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';

class SendOtpController extends GetxController {
  final SendOtpProvider sendOtpProvider;

  SendOtpController({required this.sendOtpProvider});

  final userController = Get.find<DashboardController>();
  final email = Rx<String?>(null);

  @override
  void onInit() {
    final maskedEmail = AppHelpers.maskEmail(userController.profile.value?.email ?? '');
    email.value = maskedEmail;
    super.onInit();
  }

  void sendOtp() async {
    showLoading();

    try {
      final response = await sendOtpProvider.sendOtp();

      if (response.statusCode == 200) {
        Get.back();
        if (response.data['otp_aktif']) {
          infoSnackbar(
            'Kode OTP Masih Aktif',
            'Kode OTP sudah dikirim, silahkan cek kembali email anda dengan benar',
          );
        }
        Get.offAndToNamed('/verifyOtp');
      }
    } on DioException catch (e) {
      Get.back();
      failedSnackbar(
        'Ups sepertinya terjadi kesalahan',
        'code:${e.response?.statusCode}',
      );
    }
  }
}
