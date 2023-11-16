import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_button.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';

void successRedeem(BuildContext context, String prizeDesc, String point) {
  AwesomeDialog(
    context: context,
    animType: AnimType.scale,
    dialogType: DialogType.success,
    dismissOnTouchOutside: false,
    dismissOnBackKeyPress: false,
    headerAnimationLoop: true,
    padding: const EdgeInsets.all(10),
    body: Column(
      children: [
        const BaseText(
          text: 'Tukan Poin Berhasil',
          size: 20,
          bold: FontWeight.w500,
        ),
        const SizedBox(height: 10),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: [
              const TextSpan(text: 'Selamat anda mendapatkan '),
              TextSpan(
                text: '$prizeDesc ',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const TextSpan(text: 'dengan menukarkan '),
              TextSpan(
                text: '$point poin',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    btnOk: BaseButton(
      bgColor: purpleColor,
      fgColor: Colors.white,
      label: 'Ok',
      onPressed: () {
        Get.back();
        Get.offAllNamed('/dashboard');
      },
    ),
  ).show();
}
