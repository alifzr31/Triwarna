import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_formgroupfield.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';
import 'package:triwarna_rebuild/app/modules/profile/controller.dart';
import 'package:triwarna_rebuild/app/modules/profile/edit_profile/components/item_field.dart';

class FormViewAccount extends StatelessWidget {
  FormViewAccount({super.key});
  final controller = Get.find<ProfileController>();
  final userController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: Get.width,
        color: Colors.white,
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemField(
              label: 'Username',
              value: controller.usernameController.value.text,
            ),
            const SizedBox(height: 15),
            ItemField(
              label: 'Email',
              value: controller.emailController.value.text,
            ),
            const SizedBox(height: 15),
            ItemField(
              label: 'No. Telepon',
              value: userController.profile.value?.contact == null ||
                      userController.profile.value?.contact == ''
                  ? '-'
                  : userController.profile.value?.contact ?? '-',
            ),
          ],
        ),
      ),
    );
  }
}

class FormEditAccount extends StatelessWidget {
  FormEditAccount({super.key});
  final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: Get.width,
        color: Colors.white,
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemField(
              label: 'Username',
              value: controller.usernameController.value.text,
            ),
            const SizedBox(height: 15),
            ItemField(
              label: 'Email',
              value: controller.emailController.value.text,
            ),
            const SizedBox(height: 15),
            BaseFormGroupField(
              label: 'No. Telepon',
              hint: 'Masukkan no. telepon anda',
              controller: controller.noTelpController.value,
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value!.length < 11) {
                  return 'No. telepon tidak valid';
                }

                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
