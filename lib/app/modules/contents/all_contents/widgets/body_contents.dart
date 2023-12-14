import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/modules/contents/all_contents/components/event_content.dart';
import 'package:triwarna_rebuild/app/modules/contents/all_contents/components/promo_content.dart';
import 'package:triwarna_rebuild/app/modules/contents/controller.dart';

class BodyContents extends StatelessWidget {
  BodyContents({super.key});
  final controller = Get.find<ContentsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BaseText(
                      text: 'Dapatkan Promo Menarik Disini',
                      size: 16,
                      bold: FontWeight.w600,
                    ),
                    BaseText(
                      text: 'Lihat event dan promo yang tersedia disini!',
                      size: 12,
                      color: Colors.grey.shade600,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  TabBar(
                    onTap: (index) => controller.currentTab.value = index,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                      Tab(
                        child: BaseText(
                          text: 'Event',
                          color: Colors.black,
                          bold: controller.currentTab.value == 0
                              ? FontWeight.w600
                              : FontWeight.w500,
                        ),
                      ),
                      Tab(
                        child: BaseText(
                          text: 'Promo',
                          color: Colors.black,
                          bold: controller.currentTab.value == 1
                              ? FontWeight.w600
                              : FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        EventContent(),
                        PromoContent(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
