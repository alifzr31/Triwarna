import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_button.dart';
import 'package:triwarna_rebuild/app/components/base_formgroupfield.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/app_helpers.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/auth/widgets/forgot_password/reset_password/controller.dart';

class FormResetPassword extends StatelessWidget {
  FormResetPassword({super.key});
  final controller = Get.find<ResetPasswordController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseText(
                    text: 'Reset Password',
                    size: 20,
                    bold: FontWeight.w600,
                    color: Colors.white,
                  ),
                  BaseText(
                    text: 'Silahkan atur ulang password anda',
                    size: 12,
                    color: Colors.white70,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Form(
              key: controller.formKey.value,
              child: Column(
                children: [
                  BaseFormGroupFieldAuth(
                    label: 'Password Baru',
                    hint: 'Password Baru',
                    controller: controller.newPasswordController.value,
                    obscureText: controller.obscureNewPass.value,
                    suffixIcon: IconButton(
                      color: Colors.white,
                      onPressed: () => controller.obscureNewPass.value =
                          !controller.obscureNewPass.value,
                      icon: Icon(controller.obscureNewPass.value
                          ? EvaIcons.eye
                          : EvaIcons.eyeOff),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password baru tidak boleh kosong';
                      } else {
                        if (value.length < 8) {
                          return 'Password minimal berjumlah 8 karakter';
                        } else {
                          if (!AppHelpers.passwordValidation.hasMatch(value)) {
                            return 'Setidaknya password harus mengandung 1 huruf besar, 1 huruf kecil, dan 1 angka';
                          }
                        }
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  BaseFormGroupFieldAuth(
                    label: 'Konfirmasi Password',
                    hint: 'Konfirmasi Password',
                    controller: controller.confirmPasswordController.value,
                    obscureText: controller.obscureConfirmPass.value,
                    suffixIcon: IconButton(
                      color: Colors.white,
                      onPressed: () => controller.obscureConfirmPass.value =
                          !controller.obscureConfirmPass.value,
                      icon: Icon(controller.obscureConfirmPass.value
                          ? EvaIcons.eye
                          : EvaIcons.eyeOff),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Konfirmasi password tidak boleh kosong';
                      } else {
                        if (value !=
                            controller.newPasswordController.value.text) {
                          return 'Konfirmasi password tidak cocok';
                        }
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: Get.width,
                    child: BaseButton(
                      bgColor: Colors.white,
                      fgColor: purpleColor,
                      label: 'Reset Password',
                      onPressed: () {
                        if (controller.formKey.value.currentState?.validate() ??
                            false) {
                          controller.resetPassword();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
