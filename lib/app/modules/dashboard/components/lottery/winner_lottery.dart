import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/lottery/search_lottery.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/lottery/winner_card.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/lottery/winner_customer.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';

class WinnerLottery extends StatelessWidget {
  WinnerLottery({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: softPurpleColor,
          width: Get.width,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              const BaseText(
                text: 'Pemenang Pesta Undian Triwarna\nPeriode 2023',
                textAlign: TextAlign.center,
                size: 16,
                bold: FontWeight.w600,
              ),
              BaseText(
                text: 'Undian ini diberlakukan setiap 1 tahun sekali',
                textAlign: TextAlign.center,
                size: 12,
                color: Colors.grey.shade600,
              ),
            ],
          ),
        ),
        SearchLottery(),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            itemCount: 5,
            itemBuilder: (context, index) {
              return WinnerCard(
                prizeImage: 'mapicon_android.png',
                prizeName: 'Samsung Galaxy A03s',
                listCustomer: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const WinnerCustomer(
                      name: 'Alif Zakya Rafiq',
                      branch: 'Triwarna Ahmad Yani',
                      searchCustomer: null,
                    );
                  },
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
