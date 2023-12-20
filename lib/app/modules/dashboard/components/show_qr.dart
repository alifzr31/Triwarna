import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/utils/api_url.dart';
import 'package:triwarna_rebuild/app/core/values/app_helpers.dart';

void showQR(
    Gradient? gradient, String qrImage, String noMember, String contact) {
  // Get.dialog(
  //   AlertDialog(
  //     backgroundColor: Colors.transparent,
  //     elevation: 0,
  //     content: Container(
  //       height: 300,
  //       width: 300,
  //       padding: const EdgeInsets.all(15),
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(10),
  //         gradient: gradient,
  //       ),
  //       child: Center(
  //         child: Column(
  //           children: [
  //             const BaseText(
  //               text: 'Kode QR Saya',
  //               size: 18,
  //               bold: FontWeight.w600,
  //             ),
  //             Expanded(
  //               child: Image.network(
  //                 '${ApiUrl.baseStorageUrl}/${StorageUrl.qr}/$qrImage.png',
  //                 fit: BoxFit.cover,
  //               ),
  //             ),
  //             BaseText(
  //               text: noMember,
  //               bold: FontWeight.w600,
  //             ),
  //             BaseText(
  //               text: contact,
  //               bold: FontWeight.w600,
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   ),
  // );
  Get.bottomSheet(
    backgroundColor: Colors.white,
    enableDrag: false,
    SizedBox(
      height: 250,
      width: Get.width,
      child: Stack(
        children: [
          Positioned(
            right: 5,
            child: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                EvaIcons.close,
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
                        '${ApiUrl.baseStorageUrl}/${StorageUrl.qr}/$qrImage.png'),
                  ),
                  const BaseText(
                    text:
                        'Tunjukan kode QR di atas saat berbelanja di\nTriwarna',
                    textAlign: TextAlign.center,
                    bold: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
