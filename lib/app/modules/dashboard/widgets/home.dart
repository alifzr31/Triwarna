import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/header_dashboard.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/home/content_home.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/home/header_home.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/home/nearest_home.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyHome(),
    );
  }
}

class BodyHome extends StatelessWidget {
  BodyHome({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: controller.refreshHome,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          HeaderDashboard(
            child: Center(
              child: SvgPicture.asset(
                'assets/images/logo_tri.svg',
                width: 150,
              ),
            ),
          ),
          HeaderHome(),
          ContentHome(),
          NearestHome(),
        ],
      ),
    );
  }
}
