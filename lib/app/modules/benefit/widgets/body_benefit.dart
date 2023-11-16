import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/modules/benefit/components/gold_member.dart';
import 'package:triwarna_rebuild/app/modules/benefit/components/platinum_member.dart';
import 'package:triwarna_rebuild/app/modules/benefit/components/silver_member.dart';
import 'package:triwarna_rebuild/app/modules/benefit/controller.dart';

class BodyBenefit extends StatelessWidget {
  BodyBenefit({super.key});
  final controller = Get.find<BenefitController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Apa saja keuntungan membership?',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Obx(
            () => DefaultTabController(
              length: controller.tabBar.length,
              child: Expanded(
                child: Column(
                  children: [
                    TabBar(
                      tabs: List.generate(
                        controller.tabBar.length,
                        (index) => controller.tabBar[index],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          SilverMember(),
                          GoldMember(),
                          PlatinumMember(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
