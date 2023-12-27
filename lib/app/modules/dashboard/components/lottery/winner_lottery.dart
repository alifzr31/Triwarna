import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_nodata.dart';
import 'package:triwarna_rebuild/app/components/base_searchnotfound.dart';
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
    return Obx(
      () => Column(
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
          if (controller.winner.isNotEmpty) SearchLottery(),
          Expanded(
            child: controller.winnerLoading.value
                ? ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(15),
                    itemCount: 25,
                    itemBuilder: (context, index) {
                      return WinnerCard(
                        prizeImage: '',
                        prizeName: '',
                        listCustomer: ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return const WinnerCustomer(
                              name: '',
                              couponNumber: '',
                              branch: '',
                            );
                          },
                        ),
                      );
                    },
                  )
                : controller.winner.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(15),
                        child: BaseNoData(
                          image: 'empty_winner.svg',
                          title: 'Pesta Undian Segera Hadir Tahun Ini',
                          subtitle:
                              'List pemenang undian triwarna belum tersedia saat ini.\nMohon ditunggu.. ',
                          onPressed: () {
                            controller.winnerLoading.value = true;
                            controller.fetchWinner();
                          },
                        ),
                      )
                    : controller.searchWinner.value != null &&
                            controller.searchWinner.value != '' &&
                            controller.findWinner.isEmpty
                        ? BaseSearchNotFound(
                            title: 'Pemenang Tidak Ditemukan',
                            subtitle: 'Pemenang "${controller.searchWinner.value}" tidak ditemukan',
                          )
                        : RefreshIndicator(
                            onRefresh: controller.refreshWinner,
                            child: ListView.builder(
                              padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                              itemCount:
                                  controller.searchWinner.value == null ||
                                          controller.searchWinner.value == ''
                                      ? controller.winner.length
                                      : controller.findWinner.length,
                              itemBuilder: (context, index) {
                                final winner =
                                    controller.searchWinner.value == null ||
                                            controller.searchWinner.value == ''
                                        ? controller.winner[index]
                                        : controller.findWinner[index];

                                return WinnerCard(
                                  prizeImage: winner.prizeImage ?? '',
                                  prizeName: winner.prizeName ?? '',
                                  listCustomer: ListView.builder(
                                    physics: const ClampingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: winner.memberWinner?.length ?? 0,
                                    itemBuilder: (context, index) {
                                      final memberWinner =
                                          winner.memberWinner?[index];

                                      return WinnerCustomer(
                                        name: memberWinner?.memberName ?? '',
                                        couponNumber:
                                            memberWinner?.couponNumber ?? '',
                                        branch: memberWinner?.branch ?? '',
                                        searchCustomer:
                                            controller.searchWinner.value,
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
          )
        ],
      ),
    );
  }
}
