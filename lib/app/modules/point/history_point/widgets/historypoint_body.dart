import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:triwarna_rebuild/app/components/base_listtile.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/point/controller.dart';

class HistoryPointBody extends StatelessWidget {
  HistoryPointBody({super.key});
  final controller = Get.find<PointController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BaseListTile(
          leading: Icon(
            Icons.history,
            size: 45,
            color: purpleColor,
          ),
          title: 'Poin yang telah ditukarkan',
          subtitle: 'Riwayat penukaran poin terakhir anda disini!',
        ),
        Expanded(
          child: Obx(
            () => controller.pointLoading.value
                ? const Center(child: CircularProgressIndicator())
                : GroupedListView(
                    elements: controller.point,
                    groupBy: (element) {
                      final formatter = DateFormat('dd MMMM yyyy');
                      controller.date.value = formatter
                          .format(element.transactionDate ?? DateTime(0000));
                      return element.transactionDate.toString();
                    },
                    order: GroupedListOrder.DESC,
                    groupSeparatorBuilder: (value) => Container(
                      color: Colors.grey.shade200,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 5,
                      ),
                      child: BaseText(
                        text: controller.date.value ?? '',
                        size: 16,
                        bold: FontWeight.bold,
                      ),
                    ),
                    itemBuilder: (context, element) {
                      return BaseListTile(
                        title: element.info == '0'
                            ? 'Poin bertambah dari transaksi ${element.pointUsedGained}'
                            : 'Poin berhasil ditukarkan dengan ${element.pointUsedGained}',
                        subtitle: 'Sisa poin : ${element.remainingPoint}',
                        trailing: BaseText(
                          text: element.info == '0'
                              ? '+${element.addSubAmount} Poin'
                              : '-${element.addSubAmount} Poin',
                          size: 16,
                          bold: FontWeight.w600,
                          color:
                              element.info == '0' ? Colors.green : Colors.red,
                        ),
                      );
                    },
                  ),
          ),
        ),
      ],
    );
  }
}
