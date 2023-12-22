import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/pointvoucher_box.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/home/greeting_headerhome.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/home/info_headerhome.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';

class HeaderHome extends StatelessWidget {
  HeaderHome({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: controller.token.value == null ? 235 : 375,
        width: Get.width,
        child: Stack(
          children: [
            GreetingHeaderHome(
              name: controller.profile.value?.name ?? '',
              noMember: controller.profile.value?.noMember ?? '',
              token: controller.token.value,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: InfoHeaderHome(
                category:
                    controller.profile.value?.loyalty?.toLowerCase() ?? '',
                spendingTotal: controller.profile.value?.spendingTotal ?? '0',
                token: controller.token.value,
              ),
            ),
            Positioned(
              top: controller.token.value == null ? 80 : 85,
              left: 0,
              right: 0,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: PointVoucherBox(
                    totalPoint: controller.profile.value == null
                        ? ''
                        : controller.profile.value?.loyaltyPoint ?? '0',
                    totalVoucher: controller.profile.value == null
                        ? ''
                        : controller.profile.value?.voucherTotal ?? '0',
                    token: controller.token.value,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
