import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_appbar.dart';
import 'package:triwarna_rebuild/app/components/base_nodata.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/voucher/controller.dart';

class VoucherPage extends StatelessWidget {
  const VoucherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        bgColor: softPurpleColor,
        fgColor: purpleColor,
        title: 'Voucher Saya',
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: VoucherBody(),
    );
  }
}

class VoucherBody extends StatelessWidget {
  VoucherBody({super.key});
  final controller = Get.find<VoucherController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.voucherLoading.value
          ? const Center(child: CircularProgressIndicator())
          : controller.voucher.isEmpty
              ? BaseNoData(
                  label: 'Voucher masih kosong',
                  labelButton: 'Refresh Voucher',
                  onPressed: () {
                    controller.fetchVoucher();
                  },
                )
              : RefreshIndicator(
                  onRefresh: controller.refreshVoucher,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(15),
                    itemCount: controller.voucher.length,
                    itemBuilder: (context, index) {
                      final voucher = controller.voucher[index];

                      return Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: InkWell(
                          onTap: () {
                            controller.serialNumber.value = voucher.serialnumber;
                            Get.toNamed('/tracking');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: BaseText(text: voucher.prizeName ?? ''),
                          ),
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}
