import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_shimmer.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/components/nearest_box.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/core/values/custom_bottomsheet.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/locationdesc_widget.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';

class NearestHome extends StatelessWidget {
  NearestHome({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      width: Get.width,
      color: Colors.white,
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BaseText(
                      text: 'Cari Toko Terdekat',
                      size: 16,
                      bold: FontWeight.w600,
                    ),
                    BaseText(
                      text: 'Temukan toko triwarna di dekat lokasi anda',
                      size: 12,
                      color: Colors.grey.shade600,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => controller.tabIndex.value = 2,
                child: const BaseText(
                  text: 'Lihat Semua',
                  color: purpleColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Obx(
              () => controller.haspermission.isFalse ||
                      controller.servicestatus.isFalse
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/no_location.svg',
                            width: 60,
                          ),
                          TextButton.icon(
                            onPressed: () async {
                              controller.servicestatus.value =
                                  await Geolocator.isLocationServiceEnabled();
                              final permission =
                                  await Geolocator.checkPermission();

                              if (controller.servicestatus.value) {
                                if (permission == LocationPermission.denied) {
                                  customBottomSheet(280, LocationDescWidget());
                                } else if (permission ==
                                    LocationPermission.deniedForever) {
                                  customBottomSheet(280, LocationDescWidget());
                                } else {
                                  controller.fetchLocation();
                                }
                              } else {
                                customBottomSheet(280, LocationDescWidget());
                              }
                            },
                            icon: const Icon(
                              EvaIcons.refresh,
                              size: 20,
                            ),
                            label:
                                const BaseText(text: 'Nyalakan Akses Lokasi'),
                          ),
                        ],
                      ),
                    )
                  : controller.storeLoading.isTrue ||
                          controller.locationLoading.isTrue
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return const BaseShimmer(
                              child: NearestBox(
                                storeName: '',
                                address: '',
                                distance: '',
                              ),
                            );
                          },
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.store.sublist(0, 3).length,
                          itemBuilder: (context, index) {
                            final store = controller.store.sublist(0, 3)[index];
                            final dstc = double.parse(store.distance ?? '');
                            final distance = dstc.toStringAsFixed(2);

                            return NearestBox(
                              storeName: store.storeName ?? '',
                              address: store.address ?? '',
                              distance: distance,
                              onTap: () {
                                controller.tabIndex.value = 2;
                                controller.nameDetail.value = store.storeName;
                                controller.addressDetail.value = store.address;
                                controller.phoneDetail.value = store.phone;
                                if (store.distance != null) {
                                  final parser =
                                      double.parse(store.distance ?? '');
                                  controller.distanceDetail.value =
                                      '${parser.toStringAsFixed(2)} KM';
                                }
                                controller.selectedLat.value =
                                    double.parse(store.lat ?? '0');
                                controller.selectedLong.value =
                                    double.parse(store.long ?? '0');
                                controller.moveStore();
                                controller.showDetail.value = true;
                              },
                            );
                          },
                        ),
            ),
          ),
        ],
      ),
    );
  }
}
