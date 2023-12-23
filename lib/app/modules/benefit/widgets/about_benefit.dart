import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/core/values/gradients.dart';
import 'package:triwarna_rebuild/app/modules/benefit/components/benefit_item.dart';
import 'package:triwarna_rebuild/app/modules/benefit/components/card_benefit.dart';
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
            padding: const EdgeInsets.only(bottom: 15),
            child: Column(
              children: [
                Expanded(
                  child: Swiper(
                    loop: false,
                    index: controller.cardIndex.value,
                    onIndexChanged: (index) =>
                        controller.cardIndex.value = index,
                    scale: 0.9,
                    onTap: (index) => controller.cardIndex.value = index,
                    itemCount: controller.barColor.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 5),
                        child: CardBenefit(
                          cardIndex: controller.cardIndex.value,
                          gradients: controller.barColor[index],
                          levels: controller.level[index],
                        ),
                      );
                    },
                  ),
                ),
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
            child: Container(
              width: Get.width,
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: controller.cardIndex.value == 0
                    ? const Color(0xFFF5F5F5)
                    : null,
                gradient: controller.cardIndex.value == 0
                    ? null
                    : controller.cardIndex.value == 1
                        ? GradientColor.gold
                        : GradientColor.platinum,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: BaseText(
                      text: 'Benefit yang Anda Dapat',
                      size: 16,
                      bold: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView(
                      physics: const ClampingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      children: [
                        const BenefitItem(
                          text: 'Gratis biaya pendaftaran',
                        ),
                        const BenefitItem(
                          text: 'Syarat pendaftaran mudah',
                        ),
                        const BenefitItem(
                          textChildren: [
                            TextSpan(
                                text:
                                    'Poin dapat ditukar dengan hadiah langsung dengan minimum penukaran sebesar '),
                            TextSpan(
                              text: '50 poin',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        if (controller.cardIndex.value == 1)
                          const BenefitItem(
                            textChildren: [
                              TextSpan(
                                  text:
                                      'Member Gold bisa didapatkan setelah total transaksi customer dengan menggunakan digital member minimum mencapai '),
                              TextSpan(
                                text: 'Rp 10.000.000,00 ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        if (controller.cardIndex.value == 2)
                          const BenefitItem(
                            textChildren: [
                              TextSpan(
                                  text:
                                      'Member Platinum bisa didapatkan setelah total transaksi customer dengan menggunakan digital member minimum mencapai '),
                              TextSpan(
                                text: 'Rp 100.000.000,00 ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        BenefitItem(
                          textChildren: [
                            const TextSpan(text: 'Mendapatkan '),
                            TextSpan(
                              text: controller.cardIndex.value == 0
                                  ? '1 poin '
                                  : controller.cardIndex.value == 1
                                      ? '2 poin '
                                      : '3 poin ',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const TextSpan(text: 'setiap pembelian '),
                            const TextSpan(
                              text: 'Rp 100.000,00 ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const TextSpan(
                                text:
                                    'untuk semua produk triwarna menggunakan Member Silver Triwarna'),
                          ],
                        ),
                        const BenefitItem(
                          text: 'Poin tidak bisa ditukar dengan uang tunai',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
