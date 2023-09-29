import 'package:flutter/material.dart';
import 'package:flutter_sliding_box/flutter_sliding_box.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_button.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/store/backdrop_maps.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/store/header_store.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/store/list_store.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';

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
                    label: 'Cari Toko Terdekat',
                    onPressed: () {
                      controller.fetchLocation();
                    },
                  ),
                ],
              ),
            )
          : controller.locationLoading.value || controller.storeLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Stack(
                  children: [
                    SlidingBox(
                      controller: controller.boxController.value,
                      collapsed: true,
                      minHeight: 180,
                      maxHeight: Get.height * 0.5,
                      backdrop: Backdrop(
                        body: BackdropMaps(),
                      ),
                      body: SizedBox(
                        height: (Get.height * 0.5) - 30,
                        width: Get.width,
                        child: ListStore(),
                      ),
                    ),
                    HeaderStore(),
                  ],
                ),
    );
  }
}
