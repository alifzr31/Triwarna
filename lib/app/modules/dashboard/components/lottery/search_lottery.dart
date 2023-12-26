import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';

class SearchLottery extends StatelessWidget {
  SearchLottery({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(
              controller: controller.searchWinnerController.value,
              onChanged: (value) => controller.findCustomer(value),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                hintText: 'Masukkan nama atau no. undian',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: controller.searchWinner.value != '' &&
                        controller.searchWinner.value != null
                    ? IconButton(
                        onPressed: () {
                          controller.searchWinner.value = null;
                          controller.searchWinnerController.value.text = '';
                          controller.findWinner.value = [];
                        },
                        icon: const Icon(EvaIcons.close),
                        tooltip: 'Hapus Pencarian',
                      )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
