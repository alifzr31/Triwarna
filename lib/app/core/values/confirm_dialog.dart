import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_button.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';

void confirmDialog(
  BuildContext context,
  String? labelCancel,
  String? labelOk,
  String? title,
  String? desc,
  Widget? body,
  void Function()? onPressed,
) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.info,
    animType: AnimType.topSlide,
    dismissOnTouchOutside: false,
    dismissOnBackKeyPress: false,
    headerAnimationLoop: true,
    btnCancel: BaseButton(
      bgColor: yellowColor,
      fgColor: Colors.white,
      label: labelCancel ?? 'Tidak',
      onPressed: () => Get.back(),
    ),
    btnOkColor: purpleColor,
    btnOk: BaseButton(
      bgColor: purpleColor,
      fgColor: Colors.white,
      label: labelOk ?? 'Ya',
      onPressed: onPressed,
    ),
    padding: const EdgeInsets.all(10),
    title: title,
    desc: desc,
    body: body,
  ).show();
}
