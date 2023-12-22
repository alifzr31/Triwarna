import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_nodata.dart';
import 'package:triwarna_rebuild/app/components/base_shimmer.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/app_helpers.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/data/models/lottery.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/lottery/carditem_lottery.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/lottery/detail_card.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';

class MyLottery extends StatelessWidget {
  MyLottery({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Container(
            color: softPurpleColor,
            width: Get.width,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              children: [
                BaseText(
                  text:
                      'Kupon undian hadiah ini berlaku sampai\n${controller.currentDate.value}',
                  textAlign: TextAlign.center,
                  size: 16,
                  bold: FontWeight.w600,
                ),
                BaseText(
                  text:
                      'Kupon undian hanya berlaku dalam waktu 1 tahun periode!',
                  textAlign: TextAlign.center,
                  size: 12,
                  color: Colors.grey.shade600,
                ),
              ],
            ),
          ),
          Expanded(
            child: controller.lotteryLoading.value
                ? ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 25,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          BaseShimmer(
                            child: CardItemLottery(
                              noStruk: '',
                              total: '',
                              tanggal: '',
                              detailData: Container(),
                            ),
                          ),
                        ],
                      );
                    },
                  )
                : controller.lottery.isEmpty
                    ? BaseNoData(
                        image: 'empty_lottery.svg',
                        title: 'Data Undian Kosong',
                        subtitle:
                            'Dapatkan undian di setiap pembelian barang di Triwarna.',
                        labelButton: 'Refresh Undian',
                        onPressed: () {
                          controller.lotteryLoading.value = true;
                          controller.currentPageLottery.value = 1;
                          controller.hasMore.value = true;
                          controller.lottery.clear();

                          controller.fetchLottery();
                        },
                      )
                    : RefreshIndicator(
                        onRefresh: controller.refreshLottery,
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          controller: controller.scrollController.value,
                          itemCount: controller.hasMore.value
                              ? controller.lottery.length + 1
                              : controller.lottery.length,
                          itemBuilder: (context, index) {
                            final date = Rx<String?>(null);
                            final lottery = Rx<Lottery?>(null);
                            if (index < controller.lottery.length) {
                              lottery.value = controller.lottery[index];
                              date.value = AppHelpers.dateFormat(
                                  lottery.value?.tanggal ?? DateTime(0000));
                            }

                            return index < controller.lottery.length
                                ? CardItemLottery(
                                    noStruk: lottery.value?.noStruk ?? '',
                                    total: lottery.value?.total ?? '',
                                    tanggal: date.value ?? '',
                                    detailData: ListView.builder(
                                      itemCount: int.parse(
                                          lottery.value?.total ?? '0'),
                                      itemBuilder: (context, idx) {
                                        final couponDetail =
                                            lottery.value?.kuponDetail?[idx];

                                        return DetailCard(
                                          noUndian:
                                              couponDetail?.noUndian ?? '',
                                        );
                                      },
                                    ),
                                  )
                                : const Padding(
                                    padding: EdgeInsets.all(15),
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  );
                          },
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}
