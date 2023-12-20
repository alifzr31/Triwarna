import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_button.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
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
      () => controller.servicestatus.isFalse || controller.haspermission.isFalse
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.location_off_rounded,
                    size: 100,
                    color: purpleColor,
                  ),
                  const BaseText(
                    text: 'Lokasi Tidak Ditemukan',
                    size: 16,
                    bold: FontWeight.w600,
                  ),
                  const SizedBox(height: 10),
                  BaseButton(
                    bgColor: purpleColor,
                    fgColor: Colors.white,
                    label: 'Temukan Toko Terdekat',
                    onPressed: () async {
                      controller.servicestatus.value =
                          await Geolocator.isLocationServiceEnabled();
                      if (controller.servicestatus.value) {
                        await controller.fetchLocation();
                      } else {
                        await Geolocator.openLocationSettings();
                      }
                    },
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
