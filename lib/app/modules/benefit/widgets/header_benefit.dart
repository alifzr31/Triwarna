import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/core/values/gradients.dart';
import 'package:triwarna_rebuild/app/modules/benefit/components/card_level.dart';
import 'package:triwarna_rebuild/app/modules/benefit/controller.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';

class HeaderBenefit extends StatelessWidget {
  HeaderBenefit({super.key});
  final controller = Get.find<BenefitController>();
  final userController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: Get.width,
      child: Obx(() {
        final stg = 10000000 - controller.total.value;
        final gtp = 100000000 - controller.total.value;
        final slvtogld = NumberFormat.currency(
          locale: 'id_ID',
          symbol: 'Rp',
        ).format(stg);
        final gldtoplt = NumberFormat.currency(
          locale: 'id_ID',
          symbol: 'Rp',
        ).format(gtp);

        return Stack(
          children: [
            Container(
              height: 150,
              width: Get.width,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: controller.token.value == null
                    ? softPurpleColor.withOpacity(0.8)
                    : null,
                gradient: controller.token.value == null
                    ? null
                    : controller.loyaltyLevel.value?.toLowerCase() == 'silver'
                        ? GradientColor.silver
                        : controller.loyaltyLevel.value?.toLowerCase() == 'gold'
                            ? GradientColor.gold
                            : GradientColor.platinum,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: controller.token.value == null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BaseText(
                          text:
                              'Segera bergabung menjadi anggota loyalty kami!',
                          bold: FontWeight.w600,
                        ),
                        const SizedBox(height: 3),
                        BaseText(
                          text:
                              'Daftarkan diri anda untuk menjadi membership Triwarna GRATIS',
                          size: 13,
                          color: Colors.grey.shade600,
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BaseText(text: 'Total Transaksi'),
                        const SizedBox(height: 3),
                        BaseText(
                          text: controller.spendingTotal.value ?? '',
                          size: 16,
                          bold: FontWeight.w600,
                        ),
                      ],
                    ),
            ),
            Positioned(
              top: -15,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: SvgPicture.asset(
                  'assets/images/logo_grey.svg',
                  width: 200,
                ),
              ),
            ),
            Positioned(
              top: 80,
              height: 120,
              width: Get.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                children: [
                  CardLevel(
                    loyaltyLevel: 'Silver',
                    labelColor: silverSolidLabel,
                    showLabel:
                        controller.loyaltyLevel.value?.toLowerCase() == 'silver'
                            ? true
                            : false,
                    descChildren: controller.total.value < 10000000
                        ? [
                            const TextSpan(
                              text: 'Transaksi ',
                              style: TextStyle(fontSize: 12),
                            ),
                            TextSpan(
                              text: '$slvtogld ',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const TextSpan(
                              text: 'lagi ke Gold',
                              style: TextStyle(fontSize: 12),
                            ),
                          ]
                        : const [
                            TextSpan(text: 'Transaksi pembelian tercapai'),
                          ],
                    barGradient: GradientColor.silver,
                  ),
                  CardLevel(
                    loyaltyLevel: 'Gold',
                    labelColor: goldSolidLabel,
                    showLabel:
                        controller.loyaltyLevel.value?.toLowerCase() == 'gold'
                            ? true
                            : false,
                    descChildren: controller.total.value < 100000000
                        ? [
                            const TextSpan(
                              text: 'Transaksi ',
                              style: TextStyle(fontSize: 12),
                            ),
                            TextSpan(
                              text: '$gldtoplt ',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const TextSpan(
                              text: 'lagi ke Platinum',
                              style: TextStyle(fontSize: 12),
                            ),
                          ]
                        : const [
                            TextSpan(text: 'Transaksi pembelian tercapai'),
                          ],
                    barGradient: GradientColor.gold,
                  ),
                  CardLevel(
                    loyaltyLevel: 'Platinum',
                    labelGradient: GradientColor.platinumLabel,
                    showLabel: controller.loyaltyLevel.value?.toLowerCase() ==
                            'platinum'
                        ? true
                        : false,
                    descChildren: [],
                    barGradient: GradientColor.platinum,
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
