import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_appbar.dart';
import 'package:triwarna_rebuild/app/components/base_nodata.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/core/values/custom_bottomsheet.dart';
import 'package:triwarna_rebuild/app/modules/shopping/controller.dart';
import 'package:triwarna_rebuild/app/modules/shopping/detail_shoppinghistory/view.dart';

class ShoppingHistoryPage extends StatelessWidget {
  const ShoppingHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        bgColor: softPurpleColor,
        fgColor: purpleColor,
        title: 'Riwayat Belanja',
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: ShoppingHistoryBody(),
    );
  }
}

class ShoppingHistoryBody extends StatelessWidget {
  ShoppingHistoryBody({super.key});
  final controller = Get.find<ShoppingController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.shoppingHistoryLoading.value
          ? const Center(child: CircularProgressIndicator())
          : controller.shoppingHistory.isEmpty
              ? BaseNoData(
                  label: 'Riwayat belanja masih kosong',
                  labelButton: 'Refresh Riwayat Belanja',
                  onPressed: () {},
                )
              : RefreshIndicator(
                  onRefresh: controller.refreshShoppingHistory,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(15),
                    itemCount: controller.shoppingHistory.length,
                    itemBuilder: (context, index) {
                      final shoppingHistory = controller.shoppingHistory[index];

                      return Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: InkWell(
                          onTap: () {
                            controller.docnum.value = shoppingHistory.docnum;
                            customBottomSheet(
                              300,
                              const DetailShoppingHistoryPage(),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: [
                                BaseText(text: shoppingHistory.docnum ?? ''),
                                BaseText(text: shoppingHistory.totalItem ?? ''),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}
