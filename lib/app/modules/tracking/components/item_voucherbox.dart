import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_shimmer.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';

class ItemVoucherBox extends StatelessWidget {
  const ItemVoucherBox({
    Key? key,
    required this.prizeName,
    required this.voucherCode,
    required this.complete,
  }) : super(key: key);

  final String prizeName;
  final String voucherCode;
  final bool complete;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 2,
          color: complete ? purpleColor : softPurpleColor,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: complete ? purpleColor : softPurpleColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: Column(
                children: [
                  BaseText(
                    text: 'Nama Hadiah',
                    size: 12,
                    color: complete ? Colors.white : purpleColor,
                  ),
                  const SizedBox(height: 2),
                  prizeName == ''
                      ? BaseShimmer(
                          child: Container(
                            height: 15,
                            width: Get.width * 0.38,
                            margin: const EdgeInsets.only(bottom: 4, top: 1),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        )
                      : BaseText(
                          text: prizeName,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          bold: FontWeight.w600,
                          color: complete ? Colors.white : purpleColor,
                        ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                const BaseText(
                  text: 'Kode Voucher',
                  size: 12,
                ),
                const SizedBox(height: 2),
                voucherCode == ''
                    ? BaseShimmer(
                        child: Container(
                          height: 15,
                          width: Get.width * 0.2,
                          margin: const EdgeInsets.only(bottom: 4, top: 1),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      )
                    : BaseText(
                        text: voucherCode,
                        textAlign: TextAlign.center,
                        bold: FontWeight.w600,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
