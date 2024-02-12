import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_button.dart';
import 'package:triwarna_rebuild/app/components/base_formgrouppin.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';
import 'package:triwarna_rebuild/app/modules/profile/controller.dart';

class FormChangePin extends StatelessWidget {
  FormChangePin({super.key});
  final controller = Get.find<ProfileController>();
  final userController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Form(
                key: controller.formKeyChangePin.value,
                child: Column(
                  children: [
                    BaseFormGroupPin(
                      label: 'PIN Sekarang',
                      controller: controller.changeCurrentPinController.value,
                      obscureText: controller.showChangeCurrentPin.value,
                      icon: controller.showChangeCurrentPin.value
                          ? EvaIcons.eye
                          : EvaIcons.eyeOff,
                      onPressed: () => controller.showChangeCurrentPin.value =
                          !controller.showChangeCurrentPin.value,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'PIN Sekarang tidak boleh kosong';
                        } else {
                          if (value != userController.profile.value?.pin) {
                            return 'PIN tidak cocok atau salah';
                          }
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    BaseFormGroupPin(
                      label: 'PIN Baru',
                      controller: controller.changeNewPinController.value,
                      obscureText: controller.showChangeNewPin.value,
                      icon: controller.showChangeNewPin.value
                          ? EvaIcons.eye
                          : EvaIcons.eyeOff,
                      onPressed: () => controller.showChangeNewPin.value =
                          !controller.showChangeNewPin.value,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'PIN Baru tidak boleh kosong';
                        } else {
                          if (value ==
                              controller
                                  .changeCurrentPinController.value.text) {
                            return 'PIN Baru tidak boleh sama dengan PIN Sekarang';
                          }
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    BaseFormGroupPin(
                      label: 'Konfirmasi PIN Baru',
                      controller: controller.changeConfirmPinController.value,
                      obscureText: controller.showChangeConfirmNewPin.value,
                      icon: controller.showChangeConfirmNewPin.value
                          ? EvaIcons.eye
                          : EvaIcons.eyeOff,
                      onPressed: () => controller.showChangeConfirmNewPin
                          .value = !controller.showChangeConfirmNewPin.value,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Konfirmasi PIN baru tidak boleh kosong';
                        } else {
                          if (value !=
                              controller.changeNewPinController.value.text) {
                            return 'Konfirmasi PiN tidak cocok';
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
          Container(
            width: Get.width,
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                SizedBox(
                  width: Get.width,
                  child: BaseButton(
                    bgColor: purpleColor,
                    fgColor: Colors.white,
                    label: 'Ganti PIN',
                    onPressed: () {
                      if (controller.formKeyChangePin.value.currentState!
                          .validate()) {
                        controller.changePin();
                      }
                    },
                  ),
                ),
                CupertinoButton(
                  minSize: 25,
                  padding: EdgeInsets.zero,
                  onPressed: () => Get.toNamed('/sendOtp'),
                  child: BaseText(
                    text: 'Lupa PIN',
                    size: 12,
                    color: Colors.grey.shade600,
                    bold: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
