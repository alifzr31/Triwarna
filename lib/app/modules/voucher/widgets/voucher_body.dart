import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_tabbar.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/modules/voucher/controller.dart';
import 'package:triwarna_rebuild/app/modules/voucher/widgets/voucher_complete.dart';
import 'package:triwarna_rebuild/app/modules/voucher/widgets/voucher_progress.dart';

class VoucherBody extends StatelessWidget {
  VoucherBody({super.key});
  final controller = Get.find<VoucherController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DefaultTabController(
        length: 2,
        initialIndex: controller.currentTab.value,
        child: Column(
          children: [
            BaseTabBar(
              onTap: (index) => controller.currentTab.value = index,
              tabs: [
                BaseText(text: 'Belum Selesai (${controller.voucherProgress.length})'),
                BaseText(text: 'Sudah Selesai (${controller.voucherComplete.length})'),
              ],
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  VoucherProgress(),
                  VoucherComplete(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
