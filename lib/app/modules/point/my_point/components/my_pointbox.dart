import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_shimmer.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/point/my_point/components/footer_menubox.dart';
import 'package:triwarna_rebuild/app/modules/point/my_point/components/my_pointcard.dart';

class MyPointBox extends StatelessWidget {
  const MyPointBox({
    Key? key,
    required this.totalPoint,
    required this.totalTransaction,
    required this.loyaltyLevel,
    required this.proggressWidth,
    required this.lastTransaction,
    this.colorLabel,
    this.gradientLabel,
    this.gradientLevel,
  }) : super(key: key);

  final String totalPoint;
  final String totalTransaction;
  final String loyaltyLevel;
  final String lastTransaction;
  final double? proggressWidth;
  final Color? colorLabel;
  final Gradient? gradientLabel;
  final Gradient? gradientLevel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: Get.width,
        child: Material(
          color: Colors.white,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: yellowColor,
              width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/point_icon.svg',
                      width: 30,
                    ),
                    const SizedBox(width: 5),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: yellowColor,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: BaseText(
                        text: '$totalPoint Poin',
                        color: Colors.white,
                        size: 15,
                        bold: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const BaseText(text: 'Total Transaksi'),
                BaseText(
                  text: totalTransaction,
                  size: 16,
                  bold: FontWeight.bold,
                ),
                MyPointCard(
                  loyaltyLevel: loyaltyLevel,
                  colorLabel: colorLabel,
                  gradientLabel: gradientLabel,
                  proggressWidth: proggressWidth,
                  gradientLevel: gradientLevel,
                  lastTransaction: lastTransaction,
                ),
                const SizedBox(height: 10),
                const Expanded(
                  child:  FooterMenuBox(
                    showHistoryButton: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyPointBoxLoading extends StatelessWidget {
  const MyPointBoxLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: Get.width,
        child: Material(
          color: Colors.white,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: yellowColor,
              width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/point_icon.svg',
                      width: 30,
                    ),
                    const SizedBox(width: 5),
                    BaseShimmer(
                      child: Container(
                        height: 25,
                        width: 75,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const BaseText(text: 'Total Transaksi'),
                BaseShimmer(
                  child: Container(
                    height: 17,
                    width: 160,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
                const MyPointCardLoading(),
                const FooterMenuBox(
                  showHistoryButton: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
