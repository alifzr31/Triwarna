import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';

class WinnerLottery extends StatelessWidget {
  WinnerLottery({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Pemenang Undian'),
    );
  }
}