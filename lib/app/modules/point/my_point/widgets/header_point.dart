import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/core/values/gradients.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';
import 'package:triwarna_rebuild/app/modules/point/controller.dart';
import 'package:triwarna_rebuild/app/modules/point/my_point/components/my_pointbox.dart';

class HeaderPoint extends StatelessWidget {
  HeaderPoint({super.key});
  final controller = Get.find<PointController>();
  final userController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 347,
      width: Get.width,
      color: Colors.white,
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BaseText(
            text: 'Tukar poin anda dengan hadiah menarik',
            size: 16,
            bold: FontWeight.w600,
          ),
          const SizedBox(height: 3),
          BaseText(
            text: 'Minimal penukaran 50 poin!',
            size: 12,
            color: Colors.grey.shade600,
          ),
          const SizedBox(height: 15),
          Obx(
            () => controller.pointLoading.value
                ? const MyPointBoxLoading()
                : MyPointBox(
                    totalPoint: controller.lastPoint.value ?? '',
                    totalTransaction: controller.totalTransaction.value ?? '',
                    loyaltyLevel: userController.profile.value?.loyalty
                            .toString()
                            .capitalize ??
                        '',
                    proggressWidth: controller.spendingTotal.value *
                        (Get.width / 100000000),
                    gradientLevel:
                        userController.profile.value?.loyalty?.toLowerCase() ==
                                'silver'
                            ? GradientColor.silver
                            : userController.profile.value?.loyalty
                                        ?.toLowerCase() ==
                                    'gold'
                                ? GradientColor.gold
                                : GradientColor.platinum,
                    lastTransaction: controller.lastTransaction.value ?? '',
                    colorLabel:
                        userController.profile.value?.loyalty?.toLowerCase() ==
                                'silver'
                            ? silverSolidLabel
                            : userController.profile.value?.loyalty
                                        ?.toLowerCase() ==
                                    'gold'
                                ? goldSolidLabel
                                : null,
                    gradientLabel:
                        userController.profile.value?.loyalty?.toLowerCase() ==
                                'platinum'
                            ? GradientColor.platinumLabel
                            : null,
                  ),
          ),
        ],
      ),
    );
  }
}
