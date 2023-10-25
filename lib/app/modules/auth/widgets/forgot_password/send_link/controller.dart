import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:open_mail_app/open_mail_app.dart';
import 'package:triwarna_rebuild/app/components/base_button.dart';
import 'package:triwarna_rebuild/app/core/values/loading.dart';
import 'package:triwarna_rebuild/app/core/values/snackbars.dart';
import 'package:triwarna_rebuild/app/data/providers/forgot_password/sendlink_provider.dart';

class SendLinkController extends GetxController {
  final SendLinkProvider sendLinkProvider;

  SendLinkController({required this.sendLinkProvider});

  final email = Rx<String?>(null);
  final sent = false.obs;

  @override
  void onInit() {
    email.value = Get.arguments;
    super.onInit();
  }

  void sendLink() async {
    final formData = dio.FormData.fromMap({
      'email': email.value,
    });

    showLoading();

    try {
      final response = await sendLinkProvider.sendLink(formData);

      if (response.statusCode == 200) {
        sent.value = true;
        Get.back();
      }
    } on dio.DioException catch (e) {
      Get.back();
      failedSnackbar(
        'Ups sepertinya terjadi kesalahan',
        'code:(${e.response?.statusCode})',
      );
    }
  }

  void openMailApp() async {
    final result = await OpenMailApp.openMailApp();

    if (!result.didOpen && !result.canOpen) {
      Get.dialog(
        AlertDialog(
          title: Text("Open Mail App"),
          content: Text("No mail apps installed"),
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
