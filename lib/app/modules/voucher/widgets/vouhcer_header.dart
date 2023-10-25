import 'package:flutter/material.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';

class VoucherHeader extends StatelessWidget {
  const VoucherHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BaseText(
              text: 'Scan barcode untuk mendapatkan hadiah',
              size: 16,
              bold: FontWeight.w600,
            ),
            BaseText(
              text: 'Lihat list voucher undian anda disini!',
              size: 12,
              color: Colors.grey.shade600,
            ),
          ],
        ),
      ),
    );
  }
}
