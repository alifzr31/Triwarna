import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:triwarna_rebuild/app/components/base_listtile.dart';
import 'package:triwarna_rebuild/app/components/base_nodata.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/app_helpers.dart';
import 'package:triwarna_rebuild/app/modules/point/controller.dart';

class DecreasePoint extends StatelessWidget {
  DecreasePoint({super.key});
  final controller = Get.find<PointController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.pointLoading.value
          ? const Center(child: CircularProgressIndicator())
          : controller.decreasePoint.isEmpty
              ? Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(15),
                  child: BaseNoData(
                    image: 'empty_point.svg',
                    title: 'Riwayat Poin Kosong',
                    subtitle:
                        'Transaksi barang untuk mendapatkan poin, lalu tukarkan dengan hadiah menarik.',
                    labelButton: 'Refresh Riwayat Poin',
                    onPressed: () {
                      controller.pointLoading.value = true;
                      controller.fetchPoint();
                    },
                  ),
                )
              : GroupedListView(
                  elements: controller.decreasePoint,
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
                        const TextSpan(
                            text: 'Poin berhasil ditukarkan dengan '),
                        TextSpan(
                          text: element.pointUsedGained,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                      subtitle: date,
                      trailing: BaseText(
                        text: '-${element.addSubAmount} Poin',
                        size: 16,
                        bold: FontWeight.w600,
                        color: Colors.red,
                      ),
                    );
                  },
                ),
    );
  }
}
