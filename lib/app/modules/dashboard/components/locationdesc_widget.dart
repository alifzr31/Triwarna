import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';

class LocationDescWidget extends StatelessWidget {
  LocationDescWidget({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 10,
          child: IconButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(softPurpleColor),
              foregroundColor: MaterialStatePropertyAll(purpleColor),
            ),
            onPressed: () => Get.back(),
            icon: const Icon(EvaIcons.close),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BaseText(
                text: 'Izin Akses Lokasi',
                size: 20,
                bold: FontWeight.w600,
              ),
              const SizedBox(height: 10),
              BaseText(
                text:
                    'Berikan kami izin untuk mengakses lokasi anda, berikut fitur yang membutuhkan izin lokasi :',
                size: 16,
                bold: FontWeight.w500,
                color: Colors.grey.shade600,
              ),
              const Expanded(
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: softPurpleColor,
                      foregroundColor: purpleColor,
                      radius: 30,
                      child: Icon(
                        EvaIcons.pin,
                        size: 30,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: BaseText(
                        text:
                            'Mendapatkan toko Triwarna terdekat dari lokasi anda',
                        bold: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: [
                    const TextSpan(
                        text: 'Anda dapat kembali mematikan izin lokasi di '),
                    TextSpan(
                      text: 'pengaturan',
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          await Geolocator.openAppSettings();
                        },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    if (controller.servicestatus.isFalse) {
                      Geolocator.openLocationSettings();
                    } else {
                      if (controller.haspermission.isFalse) {
                        Geolocator.openAppSettings();
                      }
                    }
                  },
                  child: BaseText(
                      text: controller.servicestatus.isFalse
                          ? 'Ya, nyalakan lokasi'
                          : 'Ya, berikan izin'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
