import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_formgrouppin.dart';
import 'package:triwarna_rebuild/app/modules/auth/controller.dart';
import 'package:triwarna_rebuild/app/modules/profile/delete_account/controller.dart';

class DeleteAccountForm extends StatelessWidget {
  DeleteAccountForm({super.key});
  final controller = Get.find<DeleteAccountController>();
  final tes = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: controller.sent.value,
        child: Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: controller.formKey.value,
              child: Column(
                children: [
                  BaseFormGroupPin(
                    label: 'Kode OTP',
                    controller: controller.otpController.value,
                    obscureText: false,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Kode OTP tidak boleh kosong';
                      } else {
                        if (value.length < 6) {
                          return 'Kode OTP tidak valid';
                        }
                      }

                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
