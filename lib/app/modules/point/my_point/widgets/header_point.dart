import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';
import 'package:triwarna_rebuild/app/modules/point/controller.dart';
import 'package:triwarna_rebuild/app/modules/point/my_point/components/mypoint_card.dart';

class HeaderPoint extends StatelessWidget {
  HeaderPoint({super.key});
  final controller = Get.find<PointController>();
  final userController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 140,
        width: Get.width,
        child: Stack(
          children: [
            Container(
              height: 90,
              width: Get.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                gradient: LinearGradient(
                  colors: [
                    softPurpleColor,
                    purpleColor,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            MyPointCard(
              loyaltyPoint: userController.profile.value?.loyaltyPoint ?? '0',
              pointLoading: controller.pointLoading.value,
            ),
          ],
        ),
      ),
    );
  }
}
