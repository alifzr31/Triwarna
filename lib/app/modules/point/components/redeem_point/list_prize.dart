import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/modules/point/controller.dart';

class ListPrize extends StatelessWidget {
  ListPrize({super.key});
  final controller = Get.find<PointController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () {
          final filtered = controller.prize
              .where((e) => e.prizeName
                  .toString()
                  .toLowerCase()
                  .contains(controller.searchPrize.value ?? ''))
              .toList();

          return controller.prizeLoading.value
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                  itemCount: controller.searchPrize.value == null
                      ? controller.prize.length
                      : filtered.length,
                  itemBuilder: (context, index) {
                    final prize = controller.searchPrize.value == null
                        ? controller.prize[index]
                        : filtered[index];

                    return Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: BaseText(text: prize.prizeName ?? ''),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
