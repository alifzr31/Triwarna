import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_nodata.dart';
import 'package:triwarna_rebuild/app/modules/voucher/components/card_voucher.dart';
import 'package:triwarna_rebuild/app/modules/voucher/controller.dart';

class VoucherBody extends StatelessWidget {
  VoucherBody({super.key});
  final controller = Get.find<VoucherController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => controller.isLoading.value
            ? ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(15),
                itemCount: 25,
                itemBuilder: (context, index) {
                  return const CardVoucherLoading();
                },
              )
            : controller.voucher.isEmpty
                ? Padding(
                  padding: const EdgeInsets.all(15),
                  child: BaseNoData(
                      image: 'empty_voucher.svg',
                      title: 'Voucher Tidak Ada',
                      subtitle: 'Untuk mendapatkan voucher, tukar point dengan hadiah yang tersedia.',
                      labelButton: 'Refresh Voucher',
                      onPressed: () {
                        controller.isLoading.value = true;
                        controller.fetchVoucher();
                      },
                    ),
                )
                : RefreshIndicator(
                    onRefresh: controller.refreshVoucher,
                    child: ListView.builder(
                      padding: const EdgeInsets.all(15),
                      itemCount: controller.voucher.length,
                      itemBuilder: (context, index) {
                        final voucher = controller.voucher[index];

                        return CardVoucher(
                          qrImage: voucher.qrcode ?? '',
                          namaBarang: voucher.hadiah?.deskripsiBarang ?? '',
                          serialNumber: voucher.code ?? '',
                          status: voucher.statusHadiah?.status ?? '',
                          medalImage: controller.loyaltyLevel.value
                                      ?.toLowerCase() ==
                                  'silver'
                              ? 'silver_medal.svg'
                              : controller.loyaltyLevel.value?.toLowerCase() ==
                                      'gold'
                                  ? 'gold_medal.svg'
                                  : 'platinum_medal.svg',
                          onTap: () {
                            Get.toNamed(
                              '/tracking',
                              arguments: voucher.serialNumber,
                            );
                          },
                        );
                      },
                    ),
                  ),
      ),
    );
  }
}
