import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_button.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/data/providers/auth_provider.dart';
import 'package:triwarna_rebuild/app/modules/auth/controller.dart';

void logoutDialog(BuildContext context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.info,
    animType: AnimType.topSlide,
    dismissOnTouchOutside: true,
    dismissOnBackKeyPress: false,
    headerAnimationLoop: true,
    btnCancel: BaseButton(
      bgColor: yellowColor,
      fgColor: Colors.white,
      label: 'Tidak',
      onPressed: () => Get.back(),
    ),
    btnOkColor: purpleColor,
    btnOk: BaseButton(
      bgColor: purpleColor,
      fgColor: Colors.white,
      label: 'Ya',
      onPressed: () {
        Get.back();
        final authController =
            Get.put(AuthController(authProvider: AuthProvider()));
        authController.logout();
      },
    ),
    padding: const EdgeInsets.all(10),
    title: 'Apakah anda yakin?',
    desc: 'Anda yakin ingin log out?',
  ).show();
}
