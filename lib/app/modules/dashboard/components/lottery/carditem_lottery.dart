import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';

class CardItemLottery extends StatelessWidget {
  const CardItemLottery({
    Key? key,
    required this.noStruk,
    required this.couponTotal,
    required this.date,
    this.onTap,
  }) : super(key: key);

  final String noStruk;
  final String couponTotal;
  final String date;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            width: Get.width,
            height: 110,
            decoration: const BoxDecoration(
              color: purpleColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/undian.png',
                  width: 110,
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const BaseText(
                        text: 'No. Struk',
                        textAlign: TextAlign.center,
                        size: 16,
                        color: softPurpleColor,
                        bold: FontWeight.w600,
                      ),
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: softPurpleColor,
                          borderRadius: BorderRadius.circular(120),
                        ),
                        child: BaseText(
                          text: noStruk,
                          textAlign: TextAlign.center,
                          color: purpleColor,
                          bold: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 62,
                          height: 50,
                          decoration: const BoxDecoration(
                            color: softPurpleColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(70),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 12,
                        right: 10,
                        child: BaseText(
                          text: '${couponTotal}x',
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          color: purpleColor,
                          size: 16,
                          bold: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Text(date),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: const BaseText(
                    text: 'Lihat Detail',
                    color: yellowColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
