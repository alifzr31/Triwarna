import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/lottery/my_lottery.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/lottery/winner_lottery.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';

class BodyLottery extends StatelessWidget {
  BodyLottery({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => DefaultTabController(
          length: 2,
          initialIndex: controller.currentTabLottery.value,
          child: Column(
            children: [
              TabBar(
                onTap: (index) => controller.currentTabLottery.value = index,
                labelPadding: const EdgeInsets.symmetric(vertical: 10),
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
                labelStyle: const TextStyle(
                  color: purpleColor,
                  fontWeight: FontWeight.w600,
                ),
                tabs: const [
                  BaseText(text: 'Undian Saya'),
                  BaseText(text: 'Pemenang Undian'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    MyLottery(),
                    WinnerLottery(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
