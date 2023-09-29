import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:triwarna_rebuild/app/components/base_nodata.dart';
import 'package:triwarna_rebuild/app/components/base_shimmer.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/data/models/lottery.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/lottery/carditem_lottery.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';

class BodyLottery extends StatelessWidget {
  BodyLottery({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => controller.token.value == null
            ? const Center(
                child: BaseText(
                  text: 'Anda Belum Melakukan Log In',
                  size: 16,
                  color: purpleColor,
                  bold: FontWeight.w600,
                ),
              )
            : controller.lotteryLoading.value
                ? ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(15),
                    itemCount: 25,
                    itemBuilder: (context, index) {
                      return BaseShimmer(
                        child: CardItemLottery(
                          noStruk: '',
                          couponTotal: '',
                          date: '',
                        ),
                      );
                    },
                  )
                : controller.lottery.isEmpty
                    ? BaseNoData(
                        label: 'Data Undian Kosong',
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
                          controller: controller.scrollController.value,
                          padding: const EdgeInsets.all(15),
                          itemCount: controller.hasMore.value
                              ? controller.lottery.length + 1
                              : controller.lottery.length,
                          itemBuilder: (context, index) {
                            final date = Rx<String?>(null);
                            final lottery = Rx<Lottery?>(null);
                            if (index < controller.lottery.length) {
                              final formatter = DateFormat('dd MMMM yyyy');
                              lottery.value = controller.lottery[index];
                              date.value = formatter.format(
                                  lottery.value?.date ?? DateTime(0000));
                            }

                            return index < controller.lottery.length
                                ? CardItemLottery(
                                    noStruk: lottery.value?.noStruk ?? '',
                                    couponTotal:
                                        lottery.value?.couponTotal ?? '',
                                    date: date.value ?? '',
                                    onTap: () {
                                      Get.toNamed('/detailLottery',
                                          arguments:
                                              lottery.value?.transactionNumber);
                                    },
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
    );
  }
}
