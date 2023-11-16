import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';
import 'package:triwarna_rebuild/app/modules/profile/controller.dart';
import 'package:triwarna_rebuild/app/modules/profile/edit_profile/components/form_personal.dart';

class PersonalInfoProfile extends StatelessWidget {
  PersonalInfoProfile({super.key});
  final controller = Get.find<ProfileController>();
  final userController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
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
                    text: 'Informasi Pribadi',
                    bold: FontWeight.w600,
                  ),
                  InkResponse(
                    onTap: () => controller.enabledEditPersonal.value =
                        !controller.enabledEditPersonal.value,
                    child: BaseText(
                      text: controller.enabledEditPersonal.value
                          ? 'Selesai'
                          : 'Ubah',
                      color: purpleColor,
                      bold: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            controller.enabledEditPersonal.value
                ? FormEditPersonal()
                : FormViewPersonal(),
          ],
        ),
      ),
    );
  }
}
