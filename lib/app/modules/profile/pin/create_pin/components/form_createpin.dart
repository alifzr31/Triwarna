import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_button.dart';
import 'package:triwarna_rebuild/app/components/base_formgrouppin.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';
import 'package:triwarna_rebuild/app/modules/profile/controller.dart';

class FormCreatePin extends StatelessWidget {
  FormCreatePin({super.key});
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
                key: controller.formKeyCreatePin.value,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseFormGroupPin(
                      label: 'PIN Baru',
                      controller: controller.createNewPinController.value,
                      obscureText: controller.showCreateNewPin.value,
                      icon: controller.showCreateNewPin.value
                          ? EvaIcons.eye
                          : EvaIcons.eyeOff,
                      onPressed: () => controller.showCreateNewPin.value =
                          !controller.showCreateNewPin.value,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'PIN Baru tidak boleh kosong';
                        }
                        
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    BaseFormGroupPin(
                      label: 'Konfirmasi PIN Baru',
                      controller: controller.createConfirmPinController.value,
                      obscureText: controller.showCreateConfirmNewPin.value,
                      icon: controller.showCreateConfirmNewPin.value
                          ? EvaIcons.eye
                          : EvaIcons.eyeOff,
                      onPressed: () => controller.showCreateConfirmNewPin
                          .value = !controller.showCreateConfirmNewPin.value,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Konfirmasi PIN baru tidak boleh kosong';
                        } else {
                          if (value != controller.createNewPinController.value.text) {
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
            child: BaseButton(
              bgColor: purpleColor,
              fgColor: Colors.white,
              label: 'Buat PIN',
              onPressed: () {
                if (controller.formKeyCreatePin.value.currentState!.validate()) {
                  controller.createPin();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
