import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';

class PointVoucherBox extends StatelessWidget {
  const PointVoucherBox({
    Key? key,
    required this.totalPoint,
    required this.totalVoucher,
  }) : super(key: key);

  final String totalPoint;
  final String totalVoucher;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.white,
      elevation: 3,
      surfaceTintColor: Colors.white,
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                Get.toNamed('/point');
              },
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/point_icon.svg',
                      width: 30,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const BaseText(
                            text: 'Poin Anda',
                            bold: FontWeight.w600,
                          ),
                          BaseText(text: totalPoint),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 40,
            width: 1,
            color: Colors.grey.shade300,
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                Get.toNamed('/voucher');
              },
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const BaseText(
                            text: 'Voucher Anda',
                            bold: FontWeight.w600,
                          ),
                          BaseText(text: totalVoucher),
                        ],
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/images/voucher.svg',
                      width: 40,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
