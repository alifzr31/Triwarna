import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_nodata.dart';
import 'package:triwarna_rebuild/app/components/base_shimmer.dart';
import 'package:triwarna_rebuild/app/modules/detail_lottery/components/card_detaillottery.dart';
import 'package:triwarna_rebuild/app/modules/detail_lottery/controller.dart';

class BodyDetailLottery extends StatefulWidget {
  const BodyDetailLottery({super.key});

  @override
  State<BodyDetailLottery> createState() => _BodyDetailLotteryState();
}

class _BodyDetailLotteryState extends State<BodyDetailLottery> {
  final controller = Get.find<LotteryContoller>();

  @override
  void initState() {
    controller.noTransaction.value = Get.arguments;
    controller.fetchDetailLottery();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(15),
              itemCount: 25,
              itemBuilder: (context, index) {
                return BaseShimmer(child: CardDetailLottery(couponNumber: ''));
              },
            )
          : controller.detailLottery.isEmpty
              ? BaseNoData(
                  label: 'Data Detail Undian Kosong',
                  labelButton: 'Refresh Detail Undian',
                  onPressed: () {
                    controller.fetchDetailLottery();
                  },
                )
              : RefreshIndicator(
                  onRefresh: controller.refreshDetailLottery,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(15),
                    itemCount: controller.detailLottery.length,
                    itemBuilder: (context, index) {
                      final detailLottery = controller.detailLottery[index];

                      return CardDetailLottery(
                          couponNumber: detailLottery.couponNumber ?? '');
                    },
                  ),
                ),
    );
  }
}
