import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/modules/tracking/components/item_voucherbox.dart';
import 'package:triwarna_rebuild/app/modules/tracking/controller.dart';

class TrackingHeader extends StatelessWidget {
  TrackingHeader({super.key});
  final controller = Get.find<TrackingController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: Colors.white,
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BaseText(
              text: 'Tracking hadiah anda',
              size: 16,
              bold: FontWeight.w600,
            ),
            BaseText(
              text: 'Lihat informasi tracking hadiah terakhir anda disini!',
              size: 12,
              color: Colors.grey.shade600,
            ),
            const SizedBox(height: 10),
            controller.isLoading.value
                ? const ItemVoucherBoxLoading()
                : ItemVoucherBox(
                    prizeName: controller.tracking.value?.hadiah?.deskripsiBarang ?? '',
                    voucherCode: controller.tracking.value?.code ?? '',
                  ),
          ],
        ),
      ),
    );
  }
}
