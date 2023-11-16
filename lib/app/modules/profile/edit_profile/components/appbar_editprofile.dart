import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_appbar.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/profile/controller.dart';

class AppBarEditProfile extends StatelessWidget implements PreferredSizeWidget {
  AppBarEditProfile({
    Key? key,
    required this.preferredSize,
  }) : super(key: key);

  @override
  final Size preferredSize;

  final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BaseAppBar(
        bgColor: purpleColor,
        fgColor: Colors.white,
        title: 'Edit Profil',
        preferredSize: const Size.fromHeight(kToolbarHeight),
        action: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InkResponse(
              splashColor: softPurpleColor.withOpacity(0.3),
              onTap: controller.enabledEditAccount.value ||
                      controller.enabledEditPersonal.value ||
                      controller.profileImage.value != null
                  ? () {
                      if (controller.formKeyEditProfil.value.currentState!
                          .validate()) {
                        controller.editProfile();
                      }
                    }
                  : null,
              child: BaseText(
                text: 'Simpan',
                color: controller.enabledEditAccount.value ||
                        controller.enabledEditPersonal.value ||
                        controller.profileImage.value != null
                    ? Colors.white
                    : Colors.grey.shade400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
