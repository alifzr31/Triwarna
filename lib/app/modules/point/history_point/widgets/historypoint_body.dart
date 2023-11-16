import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:triwarna_rebuild/app/components/base_listtile.dart';
import 'package:triwarna_rebuild/app/components/base_nodata.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/app_helpers.dart';
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
          tileColor: Colors.white,
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
                : controller.point.isEmpty
                    ? Container(
                        color: Colors.white,
                        child: BaseNoData(
                          label: 'Riwayat Poin Tidak Ada',
                          labelButton: 'Refresh Riwayat Poin',
                          onPressed: () {
                            controller.pointLoading.value = true;
                            controller.fetchPoint();
                          },
                        ),
                      )
                    : GroupedListView(
                        elements: controller.point,
                        groupBy: (element) {
                          controller.date.value = AppHelpers.monthYearFormat(
                              element.transactionDate ?? DateTime(0000));
                          return controller.date.value;
                        },
                        groupComparator: (value1, value2) =>
                            value1?.compareTo(value1) ?? 0,
                        itemComparator: (item1, item2) =>
                            item1.transactionDate?.compareTo(
                                item2.transactionDate ?? DateTime(0000)) ??
                            0,
                        order: GroupedListOrder.DESC,
                        groupSeparatorBuilder: (value) => Container(
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
                          final date = AppHelpers.dayDateFormat(
                              element.transactionDate ?? DateTime(0000));

                          return BaseListTileRichText(
                            tileColor: Colors.white,
                            leading: SvgPicture.asset(
                              'assets/images/point_icon.svg',
                              width: 35,
                            ),
                            richTitle: [
                              TextSpan(
                                  text: element.info == '0'
                                      ? 'Poin bertambah dari transaksi '
                                      : 'Poin berhasil ditukarkan dengan '),
                              TextSpan(
                                text: element.pointUsedGained,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                            subtitle: date,
                            trailing: BaseText(
                              text: element.info == '0'
                                  ? '+${element.addSubAmount} Poin'
                                  : '-${element.addSubAmount} Poin',
                              size: 16,
                              bold: FontWeight.w600,
                              color: element.info == '0'
                                  ? Colors.green
                                  : Colors.red,
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
