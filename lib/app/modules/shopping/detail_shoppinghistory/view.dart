import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/modules/shopping/controller.dart';

class DetailShoppingHistoryPage extends StatefulWidget {
  const DetailShoppingHistoryPage({super.key});

  @override
  State<DetailShoppingHistoryPage> createState() =>
      _DetailShoppingHistoryPageState();
}

class _DetailShoppingHistoryPageState extends State<DetailShoppingHistoryPage> {
  final controller = Get.find<ShoppingController>();

  @override
  void initState() {
    controller.fetchDetailShoppingHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(15),
          child: BaseText(
            text: 'Detail Riwayat Belanja',
            textAlign: TextAlign.center,
            size: 18,
            bold: FontWeight.w600,
          ),
        ),
        Expanded(
          child: Obx(
            () => controller.detailShoppingHistoryLoading.value
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                    itemCount: controller.detailShoppingHistory.length,
                    itemBuilder: (context, index) {
                      final detailShoppingHistory =
                          controller.detailShoppingHistory[index];

                      return Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: BaseText(
                              text: detailShoppingHistory.dscription ?? ''),
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
