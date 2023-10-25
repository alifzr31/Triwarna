import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';

class CardItemLottery extends StatelessWidget {
  const CardItemLottery({
    Key? key,
    required this.total,
    required this.noStruk,
    required this.tanggal,
    required this.detailData,
  }) : super(key: key);

  final String total;
  final String noStruk;
  final String tanggal;
  final Widget detailData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ExpansionTileCard(
        baseColor: Colors.white,
        expandedColor: Colors.white,
        borderRadius: BorderRadius.circular(10),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        elevation: 0,
        leading: CircleAvatar(
          backgroundColor: softPurpleColor,
          foregroundColor: purpleColor,
          child: BaseText(
            text: 'x$total',
            size: 15,
            bold: FontWeight.w600,
          ),
        ),
        title: Text(
          noStruk,
          style: const TextStyle(
            color: Colors.black,
            letterSpacing: 2,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: BaseText(
          text: tanggal,
          color: Colors.grey.shade600,
        ),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Divider(),
          ),
          const SizedBox(height: 10),
          Container(
            height: 200,
            width: Get.width,
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: detailData,
          ),
        ],
      ),
    );
  }
}
