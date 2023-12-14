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
  bool cityLoading,
  List<String> city,
  String? selectedCity,
  bool storeLoading,
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
          child: Column(
            children: [
              BaseFormGroupDropdown(
                label: 'Pilih Kota/Kabupaten',
                hint: cityLoading ? 'Mohon tunggu' : 'Pilih Kota/Kabupaten',
                items: city
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: BaseText(text: e.capitalize ?? ''),
                        ))
                    .toList(),
                onChanged: (value) {
                  selectedCity = value.toString();
                },
                validator: (value) {
                  if (selectedStore == null) {
                    return 'Silahkan pilih kota terlebih dahulu';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 15),
              BaseFormGroupDropdown(
                label: 'Pilih Toko',
                hint: 'Pilih Toko',
                items: store
                    .map((e) => DropdownMenuItem(
                          value: e.storeCode,
                          child: BaseText(
                              text: e.storeName.toString().capitalize ?? ''),
                        ))
                    .toList(),
                onChanged: (value) => selectedStore = value.toString(),
                validator: (value) {
                  if (selectedStore == null) {
                    return 'Silahkan pilih toko terlebih dahulu';
                  }

                  return null;
                },
              ),
            ],
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

void redeemDialog2(
  BuildContext context,
  Prize prize,
  String? pin,
  bool? completeProfile,
  String? selectedStore,
  String? selectedStoreName,
  String? selectedCity,
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
                  text: prize.prizeDesc,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const TextSpan(text: ' dari toko cabang '),
                TextSpan(
                  text: '$selectedStoreName ($selectedCity)',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ), () {
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
        Get.back();
        Get.toNamed(
          '/pinInput',
          arguments: {
            'prize': prize,
            'storeCode': selectedStore,
            'storeName': selectedStoreName,
          },
        );
      }
    }
  });
}
