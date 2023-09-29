import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';

class ListStore extends StatelessWidget {
  ListStore({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final findStore = controller.store
            .where((e) =>
                e.storeName.toString().toLowerCase().contains(
                    controller.findStore.value.toString().toLowerCase()) ||
                e.address.toString().toLowerCase().contains(
                    controller.findStore.value.toString().toLowerCase()))
            .toList();

        return controller.storeLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.findStore.value != null
                    ? findStore.length
                    : controller.store.length,
                itemBuilder: (context, index) {
                  final store = controller.findStore.value != null
                      ? findStore[index]
                      : controller.store[index];
                  final parser = double.parse(store.distance ?? '');
                  final distance = parser.toStringAsFixed(2);

                  return ListTile(
                    leading: SvgPicture.asset(
                      'assets/images/mapicon.svg',
                      width: 25,
                    ),
                    title: Text(store.storeName ?? ''),
                    subtitle: Text(
                      store.address ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    trailing: Text('$distance KM'),
                    onTap: () async {
                      controller.boxController.value.closeBox();
                      controller.selectedLat.value =
                          double.parse(store.lat ?? '');
                      controller.selectedLong.value =
                          double.parse(store.long ?? '');
                      await controller.moveStore();
                    },
                  );
                },
              );
      },
    );
  }
}
