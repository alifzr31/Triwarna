import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_shimmer.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';

class MemberProgress extends StatelessWidget {
  const MemberProgress({
    Key? key,
    required this.category,
    required this.currentTransaction,
  }) : super(key: key);

  final String category;
  final int currentTransaction;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: category == ''
                  ? BaseShimmer(
                      child: Container(
                        height: 15,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    )
                  : currentTransaction < 100000000
                      ? Stack(
                          children: [
                            Container(
                              height: 15,
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            currentTransaction <= 10000000
                                ? Container(
                                    height: 15,
                                    width: currentTransaction *
                                        (((Get.width - 30) / 2) / 10000000),
                                    decoration: BoxDecoration(
                                      color: yellowColor,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  )
                                : Row(
                                    children: [
                                      Container(
                                        height: 15,
                                        width: 10000000 *
                                            (((Get.width - 30) / 2) / 10000000),
                                        decoration: const BoxDecoration(
                                          color: yellowColor,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            bottomLeft: Radius.circular(5),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 15,
                                        width: currentTransaction *
                                            (((Get.width - 30) / 2) /
                                                100000000),
                                        decoration: const BoxDecoration(
                                          color: yellowColor,
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(5),
                                            bottomRight: Radius.circular(5),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                          ],
                        )
                      : Stack(
                          children: [
                            Container(
                              height: 15,
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            Container(
                              height: 15,
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: yellowColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ],
                        ),
            ),
          ),
          if (category == '') const SizedBox(height: 5),
          category == ''
              ? BaseShimmer(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/silver_medal.svg',
                            width: 25,
                          ),
                          const BaseText(text: ''),
                        ],
                      ),
                      Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/gold_medal.svg',
                            width: 25,
                          ),
                          const BaseText(text: ''),
                        ],
                      ),
                      Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/platinum_medal.svg',
                            width: 25,
                          ),
                          const BaseText(text: ''),
                        ],
                      ),
                    ],
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SvgPicture.asset(
                          'assets/images/silver_medal.svg',
                          width: category == 'silver' ? 30 : 25,
                        ),
                        BaseText(
                          text: 'Silver',
                          bold: category == 'silver' ? FontWeight.w600 : null,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SvgPicture.asset(
                          'assets/images/gold_medal.svg',
                          width: category == 'gold' ? 30 : 25,
                        ),
                        BaseText(
                          text: 'Gold',
                          bold: category == 'gold' ? FontWeight.w600 : null,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SvgPicture.asset(
                          'assets/images/platinum_medal.svg',
                          width: category == 'platinum' ? 30 : 25,
                        ),
                        BaseText(
                          text: 'Platinum',
                          bold: category == 'platinum' ? FontWeight.w600 : null,
                        ),
                      ],
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
