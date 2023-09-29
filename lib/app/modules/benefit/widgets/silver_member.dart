import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/modules/benefit/components/benefit_item.dart';
import 'package:triwarna_rebuild/app/modules/benefit/controller.dart';

class SilverMember extends StatelessWidget {
  SilverMember({super.key});
  final controller = Get.put(BenefitController());

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      physics: const ClampingScrollPhysics(),
      children: const [
        BenefitItem(text: 'Gratis biaya pendaftaran'),
        BenefitItem(text: 'Syarat pendaftaran mudah'),
        BenefitItemCustom(
          children: [
            TextSpan(
                text:
                    'Poin dapat ditukar dengan hadiah langsung dengan minimum penukaran sebesar '),
            TextSpan(
              text: '50 poin',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        BenefitItemCustom(
          children: [
            TextSpan(text: 'Mendapatkan '),
            TextSpan(
              text: '1 poin ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: 'setiap pembelian '),
            TextSpan(
              text: 'Rp 100.000,00 ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: 'untuk semua produk triwarna menggunakan Member Silver Triwarna'),
          ],
        ),
        BenefitItem(text: 'Poin tidak bisa ditukar dengan uang tunai'),
      ],
    );
  }
}
