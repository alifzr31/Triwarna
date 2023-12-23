import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
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
              ),
            ),
            if (controller.searchWinner.value != '' &&
                controller.searchWinner.value != null)
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    controller.searchWinner.value = null;
                    controller.searchWinnerController.value.text = '';
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(5),
                    child: BaseText(
                      text: 'Hapus Pencarian',
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
