import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_appbar.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/point/controller.dart';
import 'package:triwarna_rebuild/app/modules/point/my_point/widgets/header_point.dart';
import 'package:triwarna_rebuild/app/modules/point/my_point/widgets/list_prize.dart';

class PointPage extends StatelessWidget {
  const PointPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        bgColor: softPurpleColor,
        fgColor: purpleColor,
        title: 'Poin Saya',
        preferredSize: const Size.fromHeight(kToolbarHeight),
      ),
      body: PointBody(),
    );
  }
}

class PointBody extends StatelessWidget {
  PointBody({super.key});
  final controller = Get.find<PointController>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: controller.refreshPoint,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          height: Get.height * 0.888,
          width: Get.width,
          child: Column(
            children: [
              HeaderPoint(),
              ListPrize(),
            ],
          ),
        ),
      ),
    );
  }
}
