import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/utils/api_url.dart';
import 'package:triwarna_rebuild/app/core/values/app_helpers.dart';
import 'package:screen_brightness/screen_brightness.dart';

void showQR(String noMember) async {
  setBrightness(1);
  Get.bottomSheet(
    backgroundColor: Colors.white,
    clipBehavior: Clip.antiAlias,
    enableDrag: false,
    WillPopScope(
      onWillPop: () async {
        await resetBrightness();
        return true;
      },
      child: SizedBox(
        height: 300,
        width: Get.width,
        child: Stack(
          children: [
            Positioned(
              right: 5,
              child: IconButton(
                onPressed: () {
                  Get.back();
                  resetBrightness();
                },
                icon: const Icon(
                  Icons.close,
                  size: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Center(
                child: Column(
                  children: [
                    const BaseText(
                      text: 'Barcode ID Saya',
                      size: 16,
                    ),
                    SelectableText(
                      AppHelpers.addSpaces(noMember),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'OCR-A',
                      ),
                    ),
                    Expanded(
                      child: Image.network(
                        '${ApiUrl.baseStorageUrl}/qr/members/$noMember.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    BaseText(
                      text:
                          'Tunjukan kode QR di atas saat berbelanja di\nTriwarna',
                      textAlign: TextAlign.center,
                      bold: FontWeight.w500,
                      color: Colors.grey.shade600,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Future<void> setBrightness(double brightness) async {
  try {
    await ScreenBrightness().setScreenBrightness(brightness);
  } catch (e) {
    rethrow;
  }
}

Future<void> resetBrightness() async {
  try {
    await ScreenBrightness().resetScreenBrightness();
  } catch (e) {
    rethrow;
  }
}
