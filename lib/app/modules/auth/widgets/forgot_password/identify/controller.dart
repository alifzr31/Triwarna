import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:triwarna_rebuild/app/core/values/loading.dart';
import 'package:triwarna_rebuild/app/core/values/snackbars.dart';
import 'package:triwarna_rebuild/app/data/providers/forgot_password/identify_provider.dart';

class IdentifyController extends GetxController {
  final IdentifyProvider identifyProvider;

  IdentifyController({required this.identifyProvider});

  final formKey = GlobalKey<FormState>().obs;
  final userController = TextEditingController().obs;
  final showAlert = false.obs;
  final status = Rx<int?>(null);

  @override
  void dispose() {
    userController.value.dispose();
    super.dispose();
  }

  void identifyAccount() async {
    final formData = dio.FormData.fromMap({
      'email': userController.value.text,
    });

    showLoading();

    try {
      final response = await identifyProvider.identifyAccount(formData);

      if (response.statusCode == 200) {
        Get.back();
        status.value = response.data['status'];
        if (status.value == 0) {
          showAlert.value = true;
        } else if (status.value == 1) {
          showAlert.value = false;
          Get.offAndToNamed('/sendLink', arguments: response.data['email']);
        } else {
          showAlert.value = true;
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
}
