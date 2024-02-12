import 'package:dio/dio.dart%20';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:open_mail_app/open_mail_app.dart';
import 'package:triwarna_rebuild/app/components/base_button.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/app_helpers.dart';
import 'package:triwarna_rebuild/app/core/values/loading.dart';
import 'package:triwarna_rebuild/app/core/values/snackbars.dart';
import 'package:triwarna_rebuild/app/data/providers/forgot_password/sendlink_provider.dart';

class SendLinkController extends GetxController {
  final SendLinkProvider sendLinkProvider;

  SendLinkController({required this.sendLinkProvider});

  final type = Rx<String?>(null);
  final value = Rx<String?>(null);
  final maskedValue = Rx<String?>(null);
  final sent = false.obs;
  final tunggu = false.obs;

  final formKey = GlobalKey<FormState>().obs;
  final otpController = TextEditingController().obs;

  @override
  void onInit() {
    type.value = Get.arguments['type'];
    maskedValue.value = type.value == 'wa'
        ? AppHelpers.maskPhoneNumber(Get.arguments['value'])
        : AppHelpers.maskEmail(Get.arguments['value']);
    value.value = Get.arguments['value'];
    super.onInit();
  }

  @override
  void onClose() {
    otpController.value.dispose();
    super.onClose();
  }

  void sendLink() async {
    final formData = dio.FormData.fromMap({
      'type': type.value,
      'value': value.value,
    });

    showLoading();

    try {
      final response = await sendLinkProvider.sendLink(formData);

      if (response.statusCode == 200) {
        Get.back();
        sent.value = true;

        if (response.data['success'] == false) {
          tunggu.value = true;
          infoSnackbar(
            'OTP Sudah Terkirim',
            response.data['message'],
          );
        }
      }
    } on dio.DioException catch (e) {
      Get.back();
      failedSnackbar(
        'Ups sepertinya terjadi kesalahan',
        'code:(${e.response?.statusCode})',
      );
    }
  }

  void resendLink() async {
    final formData = dio.FormData.fromMap({
      'type': type.value,
      'value': value.value,
    });

    showLoading();

    try {
      final response = await sendLinkProvider.sendLink(formData);

      if (response.statusCode == 200) {
        Get.back();
        sent.value = true;

        if (response.data['success']) {
          infoSnackbar(
            'Kirim Ulang Berhasil',
            'Link reset password sudah dikirim ulang. Silahkan cek email anda',
          );
        } else {
          tunggu.value = true;
        }
      }
    } on dio.DioException catch (e) {
      Get.back();
      failedSnackbar(
        'Ups sepertinya terjadi kesalahan',
        'code:(${e.response?.statusCode})',
      );
    }
  }

  void verifyOtp() async {
    final formData = dio.FormData.fromMap({
      'value': value.value,
      'otp': otpController.value.text,
    });

    showLoading();

    try {
      final response = await sendLinkProvider.verifyOtp(formData);

      if (response.statusCode == 200) {
        Get.back();
        successSnackbar(
          'Verifikasi OTP Berhasil',
          response.data['message'],
        );
        Get.offAndToNamed(
          '/resetPassword',
          arguments: value.value,
        );
      }
    } on DioException catch (e) {
      Get.back();
      if (e.response?.statusCode == 422) {
        infoSnackbar(
          'Verifikasi OTP Gagal',
          e.response?.data['message'],
        );
      } else {
        failedSnackbar(
          'Verifikasi OTP Gagal',
          'Ups sepertinya terjadi kesalahan. code:${e.response?.statusCode}',
        );
      }
    }
  }

  void openMailApp() async {
    final result = await OpenMailApp.openMailApp();

    if (!result.didOpen && !result.canOpen) {
      Get.dialog(
        AlertDialog(
          title: const BaseText(text: "Open Mail App"),
          content: const BaseText(text: "No mail apps installed"),
          actions: <Widget>[
            BaseButton(
              label: 'Ok',
              onPressed: () {
                Get.back();
              },
            )
          ],
        ),
      );
    } else if (!result.didOpen && result.canOpen) {
      Get.dialog(
        MailAppPickerDialog(mailApps: result.options),
      );
    }
  }
}
