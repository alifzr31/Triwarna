import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';
import 'package:triwarna_rebuild/app/modules/profile/controller.dart';
import 'package:triwarna_rebuild/app/modules/profile/edit_profile/components/form_account.dart';

class AccountInfoProfile extends StatelessWidget {
  AccountInfoProfile({super.key});
  final controller = Get.find<ProfileController>();
  final userController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BaseText(
                  text: 'Informasi Akun',
                  bold: FontWeight.w600,
                ),
                if (userController.profile.value?.contact == null)
                  InkResponse(
                    onTap: () => controller.enabledEditAccount.value =
                        !controller.enabledEditAccount.value,
                    child: BaseText(
                      text: controller.enabledEditAccount.value ? 'Selesai' : 'Ubah',
                      color: purpleColor,
                      bold: FontWeight.w500,
                    ),
                  ),
              ],
            ),
          ),
          controller.enabledEditAccount.value
                ? FormEditAccount()
                : FormViewAccount(),
        ],
      ),
    );
  }
}
