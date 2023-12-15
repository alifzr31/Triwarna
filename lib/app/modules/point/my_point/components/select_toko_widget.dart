import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_button.dart';
import 'package:triwarna_rebuild/app/components/base_formgroupdropdown.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/data/models/prize.dart';
import 'package:triwarna_rebuild/app/modules/point/controller.dart';
import 'package:triwarna_rebuild/app/modules/point/my_point/components/redeem_dialog.dart';

class SelectTokoWidget extends StatelessWidget {
  SelectTokoWidget({
    Key? key,
    required this.prize,
    required this.pin,
  }) : super(key: key);

  final Prize prize;
  final String? pin;

  final controller = Get.find<PointController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        onWillPop: () async {
          controller.selectedCity.value = null;
          controller.selectedStore.value = null;
          return true;
        },
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const BaseText(
                text: 'Pengiriman/Pengambilan Barang\ndi Toko Cabang',
                size: 16,
                bold: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Expanded(
                child: Form(
                  key: controller.formKey.value,
                  child: Column(
                    children: [
                      BaseFormGroupDropdown(
                        label: '',
                        hint: controller.cityLoading.value
                            ? 'Mohon Tunggu...'
                            : 'Pilih Kota/Kabupaten',
                        items: controller.city
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: BaseText(text: e),
                                ))
                            .toList(),
                        onChanged: (value) {
                          controller.selectedCity.value = value.toString();
                          if (controller.selectedStore.value != null) {
                            controller.selectedStore.value = null;
                          }
                          controller.fetchStore();
                        },
                        validator: (value) {
                          if (controller.selectedCity.value == null) {
                            return 'Pilih kota/kabupaten tidak boleh kosong';
                          }

                          return null;
                        },
                      ),
                      BaseFormGroupDropdown(
                        label: '',
                        hint: controller.selectedCity.value == null
                            ? 'Pilih kota terlebih dahulu'
                            : controller.storeLoading.value
                                ? 'Mohon Tunggu...'
                                : 'Pilih Toko Cabang',
                        value: controller.selectedStore.value,
                        items: controller.store
                            .map((e) => DropdownMenuItem(
                                  value: e.storeCode,
                                  child: BaseText(
                                      text: e.storeName.toString().capitalize ??
                                          ''),
                                ))
                            .toList(),
                        onChanged: (value) {
                          controller.selectedStore.value = value.toString();
                          final store = controller.store
                              .where((e) => e.storeCode
                                  .toString()
                                  .contains(value.toString()))
                              .toList();
                          controller.selectedStoreName.value =
                              store.first.storeName;
                        },
                        validator: (value) {
                          if (controller.selectedCity.value != null) {
                            if (controller.selectedStore.value == null) {
                              return 'Pilih toko cabang tidak boleh kosong';
                            }
                          }

                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: Get.width,
                child: BaseButton(
                  bgColor: purpleColor,
                  fgColor: Colors.white,
                  label: 'Submit',
                  onPressed: () {
                    if (controller.formKey.value.currentState?.validate() ??
                        false) {
                      redeemDialog2(
                        context,
                        prize,
                        pin,
                        controller.completeProfile.value,
                        controller.selectedStore.value,
                        controller.selectedStoreName.value,
                        controller.selectedCity.value,
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
