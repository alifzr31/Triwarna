import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/core/values/gradients.dart';
import 'package:triwarna_rebuild/app/modules/benefit/controller.dart';

class AboutBeneffit extends StatelessWidget {
  AboutBeneffit({super.key});
  final controller = Get.find<BenefitController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Container(
            height: 80,
            width: Get.width,
            color: softPurpleColor,
            padding: const EdgeInsets.all(15),
            child: const Center(
              child: BaseText(
                text:
                    'Benefit member didapatkan dari melakukan\nTransaksi di Triwarna.',
                textAlign: TextAlign.center,
                bold: FontWeight.w500,
              ),
            ),
          ),
          Container(
            height: 190,
            width: Get.width,
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Expanded(
                  child: Swiper(
                    loop: false,
                    index: controller.cardIndex.value,
                    onIndexChanged: (index) =>
                        controller.cardIndex.value = index,
                    scale: 0.9,
                    onTap: (index) {},
                    itemCount: controller.barColor.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 2,
                        clipBehavior: Clip.antiAlias,
                        margin: EdgeInsets.zero,
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            gradient: controller.barColor[index],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              BaseText(
                                text: controller.level[index],
                                size: 18,
                                bold: FontWeight.w600,
                              ),
                              const SizedBox(height: 15),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          style: DefaultTextStyle.of(context)
                                              .style,
                                          children: const [
                                            TextSpan(
                                              text:
                                                  'Transaksi Belanja sudah tercapai ',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            TextSpan(
                                              text: 'Rp 10.000.000',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Container(
                                        height: 15,
                                        width: Get.width,
                                        decoration: BoxDecoration(
                                          color: yellowColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      BaseText(
                                        text:
                                            'Pertahankan level membermu sampai tahun berikutnya!',
                                        size: 12,
                                        color: Colors.grey.shade600,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    controller.barColor.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOutCubic,
                      height: controller.cardIndex.value == index ? 12 : 8,
                      width: controller.cardIndex.value == index ? 12 : 8,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: controller.cardIndex.value == index
                            ? purpleColor
                            : yellowColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ).toList(),
                ),
              ],
            ),
          ),
          Expanded(
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 2,
              margin: EdgeInsets.zero,
              child: Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                decoration: BoxDecoration(
                  gradient: controller.cardIndex.value == 0
                      ? GradientColor.silver
                      : controller.cardIndex.value == 1
                          ? GradientColor.gold
                          : GradientColor.platinum,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
