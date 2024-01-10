import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_nodata.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/core/values/custom_bottomsheet.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/locationdesc_widget.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/store/custom_map.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/store/detail_box.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';
import 'package:url_launcher/url_launcher.dart';

class BodyStore extends StatelessWidget {
  BodyStore({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.haspermission.isFalse || controller.servicestatus.isFalse
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: BaseNoData(
                      image: 'no_location.svg',
                      title: controller.servicestatus.isFalse
                          ? 'Akses Lokasi Tidak Aktif'
                          : controller.haspermission.isFalse
                              ? 'Akses Lokasi Tidak Diizinkan'
                              : '',
                      subtitle: controller.servicestatus.isFalse
                          ? 'Nyalakan akses lokasi perangkat anda untuk melihat toko yang ada di dekat anda'
                          : controller.haspermission.isFalse
                              ? 'Berikan akses lokasi agar dapat melihat toko yang ada di dekat anda'
                              : '',
                      labelButton: controller.servicestatus.isFalse
                          ? 'Nyalakan Akses Lokasi'
                          : controller.haspermission.isFalse
                              ? 'Izinkan Akses Lokasi'
                              : '',
                      onPressed: () async {
                        controller.servicestatus.value =
                            await Geolocator.isLocationServiceEnabled();
                        final permission = await Geolocator.checkPermission();

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
                    ),
                  ),
                ],
              ),
            )
          : controller.locationLoading.value || controller.storeLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Stack(
                  children: [
                    CustomMap(
                      lat: controller.lat.value ??
                          controller.selectedLat.value ??
                          double.parse(controller.store.first.lat ?? ''),
                      long: controller.long.value ??
                          controller.selectedLong.value ??
                          double.parse(controller.store.first.long ?? ''),
                      markers: controller.markers,
                      onTap: (latLong) {
                        if (controller.showDetail.value) {
                          controller.showDetail.value = false;
                        }
                      },
                      onMapCreated: (mapController) {
                        if (!controller.googleMapController.value.isCompleted) {
                          controller.googleMapController.value
                              .complete(mapController);
                        }
                      },
                    ),
                    if (controller.showDetail.value)
                      DetailBox(
                        storeName: controller.nameDetail.value ?? '',
                        storeAddress: controller.addressDetail.value ?? '',
                        storePhone: controller.phoneDetail.value ?? '',
                        storeDistance:
                            controller.distanceDetail.value ?? '0.00 KM',
                        lat: controller.selectedLat.value,
                        long: controller.selectedLong.value,
                        directionPressed: controller.directionStore,
                        onTapPhone: () async {
                          final url = Uri.parse(
                            'https://api.whatsapp.com/send/?phone=%2B${controller.phoneDetail.value}&text&type=phone_number&app_absent=0',
                          );
                          final canLaunch = await canLaunchUrl(url);

                          if (canLaunch) {
                            await launchUrl(
                              url,
                              mode: LaunchMode.externalApplication,
                            );
                          }
                        },
                      ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 26, right: 15),
                        child: FloatingActionButton(
                          backgroundColor: purpleColor,
                          foregroundColor: Colors.white,
                          elevation: 1,
                          onPressed: controller.myLocation,
                          child: const Icon(Icons.gps_fixed),
                        ),
                      ),
                    )
                  ],
                ),
    );
  }
}
