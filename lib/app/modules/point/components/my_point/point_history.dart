import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:triwarna_rebuild/app/components/base_nodata.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/point/components/my_point/history_item.dart';
import 'package:triwarna_rebuild/app/modules/point/controller.dart';

class PointHistory extends StatelessWidget {
  PointHistory({super.key});
  final controller = Get.find<PointController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(EvaIcons.barChart),
                SizedBox(width: 2),
                BaseText(
                  text: 'Riwayat Poin',
                  size: 18,
                  bold: FontWeight.w600,
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => controller.pointLoading.value
                  ? ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(15),
                      itemCount: 25,
                      itemBuilder: (context, index) {
                        return const HistoryItemLoading();
                      },
                    )
                  : controller.point.isEmpty
                      ? BaseNoData(
                          label: 'Riwayat poin masih kosong',
                          labelButton: 'Refresh Riwayat Poin',
                          onPressed: () {
                            controller.pointLoading.value = true;
                            controller.fetchPoint();
                          },
                        )
                      : RefreshIndicator(
                          onRefresh: controller.refreshPoint,
                          child: ListView.builder(
                            padding: const EdgeInsets.all(15),
                            itemCount: controller.point.length,
                            itemBuilder: (context, index) {
                              final point = controller.point[index];
                              final formatter = DateFormat('dd MMMM yyyy');
                              final date = formatter.format(
                                  point.transactionDate ?? DateTime(0000));

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      BaseText(
                                        text: point.info == '0'
                                            ? 'Poin ditambahkan'
                                            : 'Poin ditukarkan',
                                        bold: FontWeight.w600,
                                      ),
                                      BaseText(
                                        text: date,
                                        bold: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                  BaseText(
                                    text: point.info == '0'
                                        ? '+${point.addSubAmount}'
                                        : '-${point.addSubAmount}',
                                    color: point.info == '0'
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                  Row(
                                    children: [
                                      const BaseText(
                                        text: 'Remaining Points : ',
                                        color: purpleColor,
                                      ),
                                      BaseText(
                                          text: point.remainingPoint ?? ''),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    height: 1,
                                    width: Get.width,
                                    color: Colors.grey,
                                    margin: const EdgeInsets.only(bottom: 10),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
            ),
          ),
        ],
      ),
    );
  }
}
