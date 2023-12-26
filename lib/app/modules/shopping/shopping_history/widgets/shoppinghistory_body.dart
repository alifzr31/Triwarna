import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_nodata.dart';
import 'package:triwarna_rebuild/app/components/base_shimmer.dart';
import 'package:triwarna_rebuild/app/core/values/app_helpers.dart';
import 'package:triwarna_rebuild/app/modules/shopping/controller.dart';
import 'package:triwarna_rebuild/app/modules/shopping/detail_shoppinghistory/view.dart';
import 'package:triwarna_rebuild/app/modules/shopping/shopping_history/components/shoppinghistory_card.dart';

class ShoppingHistoryBody extends StatelessWidget {
  ShoppingHistoryBody({super.key});
  final controller = Get.find<ShoppingController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.shoppingHistoryLoading.value
          ? ListView.builder(
              padding: const EdgeInsets.all(15),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 25,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 118,
                  width: Get.width,
                  child: BaseShimmer(
                    child: Card(
                      color: Colors.grey.shade300,
                      elevation: 3,
                      margin: const EdgeInsets.only(bottom: 10),
                    ),
                  ),
                );
              },
            )
          : controller.shoppingHistory.isEmpty
              ? BaseNoData(
                  image: 'empty_shopping.svg',
                  title: 'Riwayat belanja Kosong',
                  subtitle: 'Ayo! segera transaksi menggunakan aplikasi Triwarna.',
                  onPressed: () {
                    controller.shoppingHistoryLoading.value = true;
                    controller.fetchShoppingHistory();
                  },
                )
              : RefreshIndicator(
                  onRefresh: controller.refreshShoppingHistory,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(15),
                    itemCount: controller.shoppingHistory.length,
                    itemBuilder: (context, index) {
                      final shoppingHistory = controller.shoppingHistory[index];
                      final date = AppHelpers.dayDateFormat(
                          shoppingHistory.date ?? DateTime(0000));
                      final ttl = double.parse(shoppingHistory.total ?? '0');
                      final roundedUp = ttl.ceil().obs;
                      final total = AppHelpers.rupiahFormat(roundedUp.value);

                      return ShoppingHistoryCard(
                        noStruk: shoppingHistory.noStruk ?? '',
                        totalItem: shoppingHistory.totalItem ?? '',
                        date: date,
                        total: total,
                        onTap: () {
                          controller.docnum.value = shoppingHistory.docnum;
                          controller.date.value = date;
                          controller.total.value = total;
                          Get.bottomSheet(
                            backgroundColor: Colors.white,
                            const ShoppingDetailHistoryPage(),
                          );
                        },
                      );
                    },
                  ),
                ),
    );
  }
}
