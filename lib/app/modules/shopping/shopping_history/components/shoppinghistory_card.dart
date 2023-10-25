import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';

class ShoppingHistoryCard extends StatelessWidget {
  const ShoppingHistoryCard({
    Key? key,
    required this.noStruk,
    required this.totalItem,
    required this.date,
    required this.total,
    this.onTap,
  }) : super(key: key);

  final String noStruk;
  final String totalItem;
  final String date;
  final String total;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      surfaceTintColor: Colors.white,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/images/shopping_history.svg',
                  width: 30,
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BaseText(
                        text: noStruk,
                        bold: FontWeight.w600,
                      ),
                      BaseText(
                        text: '$totalItem Barang',
                        size: 12,
                        color: Colors.grey.shade600,
                      ),
                    ],
                  ),
                ),
                InkResponse(
                  onTap: onTap,
                  child: const BaseText(
                    text: 'Lihat Detail',
                    color: purpleColor,
                    bold: FontWeight.w500,
                  ),
                )
              ],
            ),
            const SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BaseText(
                  text: date,
                  size: 12,
                  color: Colors.grey.shade600,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const BaseText(text: 'Total Harga', size: 12),
                      BaseText(text: total, bold: FontWeight.w600),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
