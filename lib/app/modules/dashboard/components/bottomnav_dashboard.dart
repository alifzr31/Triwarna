import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';

class BottomNavDashboard extends StatelessWidget {
  BottomNavDashboard({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SalomonBottomBar(
        backgroundColor: Colors.transparent,
        currentIndex: controller.tabIndex.value,
        onTap: (index) => controller.tabIndex.value = index,
        items: [
          SalomonBottomBarItem(
            icon: const Icon(EvaIcons.home),
            title: const Text('Beranda'),
          ),
          SalomonBottomBarItem(
            icon: const Icon(EvaIcons.gift),
            title: const Text('Undian'),
          ),
          SalomonBottomBarItem(
            icon: const Icon(EvaIcons.map),
            title: const Text('Toko'),
          ),
          SalomonBottomBarItem(
            icon: const Icon(EvaIcons.person),
            title: const Text('Akun'),
          ),
        ],
      ),
    );
  }
}
