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
      appBar: BaseAppBar(
        bgColor: purpleColor,
        fgColor: Colors.white,
        title: 'Poin',
        preferredSize: const Size.fromHeight(kToolbarHeight),
        action: [
          IconButton(
            onPressed: () => Get.toNamed(
              '/benefit',
              arguments: {
                'openedIndex': 1,
              },
            ),
            icon: const Icon(Icons.help_outline),
          ),
        ],
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
          height: Get.height * 0.9,
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
