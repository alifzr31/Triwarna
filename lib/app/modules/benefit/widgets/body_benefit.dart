import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_tabbar.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/modules/benefit/controller.dart';
import 'package:triwarna_rebuild/app/modules/benefit/widgets/about_benefit.dart';
import 'package:triwarna_rebuild/app/modules/benefit/widgets/faq_benefit.dart';

class BodyBenefit extends StatelessWidget {
  BodyBenefit({super.key});
  final controller = Get.find<BenefitController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DefaultTabController(
        length: 2,
        initialIndex: controller.currentTab.value,
        child: Column(
          children: [
            BaseTabBar(
              onTap: (index) => controller.currentTab.value = index,
              tabs: const [
                BaseText(text: 'Tentang Benefit'),
                BaseText(text: 'FAQ'),
              ],
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  AboutBeneffit(),
                  FaqBenefit(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
