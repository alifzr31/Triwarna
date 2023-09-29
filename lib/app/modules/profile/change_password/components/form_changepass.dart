import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_button.dart';
import 'package:triwarna_rebuild/app/components/base_formgroupfield.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/profile/controller.dart';

class FormChangePass extends StatelessWidget {
  FormChangePass({super.key});
  final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: controller.formKeyChangePass.value,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseFormGroupField(
                      label: 'Password Sekarang',
                      hint: 'Password Sekarang',
                      controller: controller.currentPasswordController.value,
                      obscureText: controller.showCurrentPass.value,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password sekarang tidak boleh kosong';
                        }

                        return null;
                      },
                      suffixIcon: IconButton(
                        onPressed: () => controller.showCurrentPass.value =
                            !controller.showCurrentPass.value,
                        icon: Icon(controller.showCurrentPass.value
                            ? EvaIcons.eye
                            : EvaIcons.eyeOff),
                      ),
                    ),
                    const SizedBox(height: 15),
                    BaseFormGroupField(
                      label: 'Password Baru',
                      hint: 'Password Baru',
                      controller: controller.newPasswordController.value,
                      obscureText: controller.showNewPass.value,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password baru tidak boleh kosong';
                        } else {
                          if (value.length < 8) {
                            return 'Minimal password berjumlah 8 karakter';
                          } else {
                            if (value ==
                                controller
                                    .currentPasswordController.value.text) {
                              return 'Password baru tidak boleh sama dengan password sekarang';
                            }
                          }
                        }

                        return null;
                      },
                      suffixIcon: IconButton(
                        onPressed: () => controller.showNewPass.value =
                            !controller.showNewPass.value,
                        icon: Icon(controller.showNewPass.value
                            ? EvaIcons.eye
                            : EvaIcons.eyeOff),
                      ),
                    ),
                    const SizedBox(height: 15),
                    BaseFormGroupField(
                      label: 'Konfirmasi Password',
                      hint: 'Konfirmasi Password Baru',
                      controller: controller.confirmPasswordController.value,
                      obscureText: controller.showConfirmPass.value,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Konfirmasi password baru tidak boleh kosong';
                        } else {
                          if (value !=
                              controller.newPasswordController.value.text) {
                            return 'Konfirmasi password baru tidak cocok';
                          }
                        }

                        return null;
                      },
                      suffixIcon: IconButton(
                        onPressed: () => controller.showConfirmPass.value =
                            !controller.showConfirmPass.value,
                        icon: Icon(controller.showConfirmPass.value
                            ? EvaIcons.eye
                            : EvaIcons.eyeOff),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: Get.width,
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: BaseButton(
              bgColor: purpleColor,
              fgColor: Colors.white,
              label: 'Ganti Password',
              onPressed: () {
                if (controller.formKeyChangePass.value.currentState!
                    .validate()) {
                  controller.changePass();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
