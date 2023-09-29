import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/widgets/account.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/widgets/home.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/widgets/lottery.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/widgets/store.dart';

class BodyDashboard extends StatelessWidget {
  BodyDashboard({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IndexedStack(
        index: controller.tabIndex.value,
        children: const [
          HomeTab(),
          LotteryTab(),
          StoreTab(),
          AccountTab(),
        ],
      ),
    );
  }
}
