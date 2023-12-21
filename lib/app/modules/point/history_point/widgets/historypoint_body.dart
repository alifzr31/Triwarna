import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_tabbar.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/modules/point/controller.dart';
import 'package:triwarna_rebuild/app/modules/point/history_point/widgets/decrease_point.dart';
import 'package:triwarna_rebuild/app/modules/point/history_point/widgets/increase_point.dart';

class HistoryPointBody extends StatelessWidget {
  HistoryPointBody({super.key});
  final controller = Get.find<PointController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DefaultTabController(
        length: 2,
        initialIndex: controller.currentTabHistory.value,
        child: Column(
          children: [
            BaseTabBar(
              onTap: (index) => controller.currentTabHistory.value,
              tabs: const [
                BaseText(text: 'Penambahan Poin'),
                BaseText(text: 'Penguarangan Poin'),
              ],
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  IncreasePoint(),
                  DecreasePoint(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
