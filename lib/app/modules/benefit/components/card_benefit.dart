import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';

class CardBenefit extends StatelessWidget {
  const CardBenefit({
    Key? key,
    required this.cardIndex,
    required this.gradients,
    required this.levels,
  }) : super(key: key);

  final int cardIndex;
  final Gradient gradients;
  final String levels;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: cardIndex == 0 ? const Color(0xFFF5F5F5) : null,
          gradient: cardIndex == 0 ? null : gradients,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            BaseText(
              text: levels,
              size: 18,
              bold: FontWeight.w600,
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: const [
                            TextSpan(
                              text: 'Transaksi Belanja sudah tercapai ',
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
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 15,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: silverSolidLabel,
                        borderRadius: BorderRadius.circular(5),
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
  }
}
