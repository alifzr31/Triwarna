import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';

class CardPoint extends StatelessWidget {
  const CardPoint({
    Key? key,
    required this.loyaltyTier,
    required this.totalSpending,
    required this.proggressWidth,
    required this.gradient,
    required this.lastTransaction,
  }) : super(key: key);

  final String loyaltyTier;
  final String totalSpending;
  final double proggressWidth;
  final Gradient gradient;
  final Widget lastTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: purpleColor,
      elevation: 0,
      margin: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BaseText(
                  text: loyaltyTier,
                  bold: FontWeight.w600,
                  color: Colors.white,
                ),
                Row(
                  children: [
                    BaseText(
                      text: totalSpending,
                      size: 12,
                      bold: FontWeight.w500,
                      color: Colors.white,
                    ),
                    const BaseText(
                      text: '/Rp 100.000.000,00',
                      size: 12,
                      bold: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 5),
            Stack(
              children: [
                Container(
                  height: 8,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                Container(
                  height: 8,
                  width: proggressWidth,
                  decoration: BoxDecoration(
                    gradient: gradient,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const BaseText(
                  text: 'Transaksi Terakhir : ',
                  size: 12,
                  bold: FontWeight.w500,
                  color: Colors.white,
                ),
                lastTransaction,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
