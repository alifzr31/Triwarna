import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:triwarna_rebuild/app/components/base_button.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';

class BottomNavCheckProfile extends StatelessWidget {
  BottomNavCheckProfile({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 280,
        width: Get.width,
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            CircularPercentIndicator(
              radius: 30,
              animation: true,
              animationDuration: 1000,
              percent: (14 - controller.jumlahNull.value) / 14,
              lineWidth: 6,
              center: BaseText(
                text: controller.completePercent.value ?? '',
                bold: FontWeight.w500,
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: purpleColor,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const BaseText(
                    text: 'Kelengkapan Profil',
                    textAlign: TextAlign.center,
                    size: 18,
                    bold: FontWeight.w500,
                  ),
                  BaseText(
                    text:
                        'Lengkapi profil anda sekarang dan dapatkan voucher dan keuntungan menarik lainnya',
                    textAlign: TextAlign.center,
                    color: Colors.grey.shade600,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: Get.width,
              child: BaseButton(
                bgColor: purpleColor,
                fgColor: Colors.white,
                label: 'Lengkapi Sekarang',
                onPressed: () {
                  Get.toNamed('/editProfile');
                },
              ),
            ),
            const SizedBox(height: 2),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: BaseText(
                text: 'Mungkin Nanti',
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
