import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_shimmer.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';

class MyPointCard extends StatelessWidget {
  const MyPointCard({
    Key? key,
    required this.loyaltyLevel,
    required this.proggressWidth,
    required this.lastTransaction,
    this.colorLabel,
    this.gradientLabel,
    this.gradientLevel,
  }) : super(key: key);

  final String loyaltyLevel;
  final String lastTransaction;
  final double? proggressWidth;
  final Color? colorLabel;
  final Gradient? gradientLabel;
  final Gradient? gradientLevel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      margin: EdgeInsets.zero,
      surfaceTintColor: Colors.white,
      clipBehavior: Clip.antiAlias,
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
                  text: loyaltyLevel,
                  bold: FontWeight.w600,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 2,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: colorLabel,
                    gradient: gradientLabel,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const BaseText(
                    text: 'Level saat ini',
                    size: 12,
                    color: Colors.white,
                  ),
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
                    color: Colors.grey.shade300,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                Container(
                  height: 8,
                  width: proggressWidth,
                  decoration: BoxDecoration(
                    gradient: gradientLevel,
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
                BaseText(
                  text: 'Transaksi Terakhir : ',
                  size: 12,
                  color: Colors.grey.shade600,
                ),
                BaseText(
                  text: lastTransaction,
                  size: 12,
                  color: Colors.grey.shade600,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyPointCardLoading extends StatelessWidget {
  const MyPointCardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      margin: EdgeInsets.zero,
      surfaceTintColor: Colors.white,
      clipBehavior: Clip.antiAlias,
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
                BaseShimmer(
                  child: Container(
                    height: 16,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
                BaseShimmer(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2,
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const BaseText(
                      text: 'Level saat ini',
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
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
                    color: Colors.grey.shade300,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                BaseShimmer(
                  child: Container(
                    height: 8,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                BaseText(
                  text: 'Transaksi Terakhir : ',
                  size: 12,
                  color: Colors.grey.shade600,
                ),
                BaseShimmer(
                  child: Container(
                    height: 14,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
