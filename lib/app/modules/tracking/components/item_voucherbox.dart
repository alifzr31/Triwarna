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
  }) : super(key: key);

  final String prizeName;
  final String voucherCode;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 2,
          color: softPurpleColor,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: softPurpleColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: Column(
                children: [
                  const BaseText(
                    text: 'Nama Hadiah',
                    size: 12,
                  ),
                  const SizedBox(height: 2),
                  BaseText(
                    text: prizeName,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    bold: FontWeight.w600,
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
                BaseText(
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

class ItemVoucherBoxLoading extends StatelessWidget {
  const ItemVoucherBoxLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 2,
          color: softPurpleColor,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: softPurpleColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: Column(
                children: [
                  const BaseText(
                    text: 'Nama Hadiah',
                    size: 12,
                  ),
                  const SizedBox(height: 2),
                  BaseShimmer(
                    child: Container(
                      height: 15,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
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
                BaseShimmer(
                  child: Container(
                    height: 15,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(3),
                    ),
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
