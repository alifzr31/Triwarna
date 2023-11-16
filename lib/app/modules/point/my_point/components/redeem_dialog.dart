import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_formgroupdropdown.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/confirm_dialog.dart';
import 'package:triwarna_rebuild/app/data/models/prize.dart';
import 'package:triwarna_rebuild/app/data/models/store.dart';

void redeemDialog(
  BuildContext context,
  Prize prize,
  List<Store> store,
  String? selectedStore,
  GlobalKey<FormState> formKey,
  String? pin,
  bool? completeProfile,
) {
  confirmDialog(
    context,
    null,
    'Yakin',
    null,
    null,
    Column(
      children: [
        const BaseText(
          text: 'Apakah Anda Yakin?',
          size: 20,
          bold: FontWeight.w500,
        ),
        const SizedBox(height: 10),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: [
              const TextSpan(text: 'Anda akan menukar '),
              TextSpan(
                text: '${prize.point} ',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const TextSpan(text: 'poin untuk mendapatkan '),
              TextSpan(
                text: '${prize.prizeDesc}',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Form(
          key: formKey,
          child: BaseFormGroupDropdown(
            label: 'Pilih Cabang',
            hint: 'Pilih cabang',
            items: store
                .map((e) => DropdownMenuItem(
                      value: e.storeCode,
                      child: BaseText(text: e.storeName ?? ''),
                    ))
                .toList(),
            onChanged: (value) => selectedStore = value.toString(),
            validator: (value) {
              if (selectedStore == null) {
                return 'Silahkan pilih cabang terlebih dahulu';
              }

              return null;
            },
          ),
        )
      ],
    ),
    () {
      if (formKey.currentState!.validate()) {
        if (pin == null) {
          Get.back();
          confirmDialog(
            context,
            'Mungkin Nanti',
            'Buat PIN',
            'Anda Belum Membuat PIN',
            'Silahkan buat PIN terlebih dahulu agar bisa menukarkan poin. Terima kasih!',
            null,
            () {
              Get.back();
              Get.toNamed('/createPin');
            },
          );
        } else {
          if (completeProfile == false) {
            Get.back();
            confirmDialog(
              context,
              'Mungkin Nanti',
              'Lengkapi',
              'Data Diri Belum Lengkap',
              'Silahkan lengkapi data diri anda terlebih dahulu agar bisa melakukan redeem poin. Terima kasih!',
              null,
              () {
                Get.back();
                Get.toNamed('/editProfile');
              },
            );
          } else {
            Get.back();
            Get.toNamed(
              '/pinInput',
              arguments: {
                'prize': prize,
                'storeCode': selectedStore,
              },
            );
          }
        }
      }
    },
  );
}
