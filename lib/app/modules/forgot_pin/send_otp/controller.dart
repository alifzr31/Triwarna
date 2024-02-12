import 'package:dio/dio.dart' as dio;
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
  final type = Rx<String?>(null);

  @override
  void onInit() {
    final maskedEmail =
        AppHelpers.maskEmail(userController.profile.value?.email ?? '');
    email.value = maskedEmail;
    super.onInit();
  }

  void sendOtp() async {
    final formData = dio.FormData.fromMap({
      'type': type.value,
    });

    showLoading();

    try {
      final response = await sendOtpProvider.sendOtp(formData);

      if (response.statusCode == 200) {
        Get.back();
        if (response.data['success'] == false) {
          infoSnackbar(
            'Kode OTP Masih Aktif',
            response.data['message'],
          );
        }
        Get.offAndToNamed(
          '/verifyOtp',
          arguments: {
            'type': type.value,
          },
        );
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
