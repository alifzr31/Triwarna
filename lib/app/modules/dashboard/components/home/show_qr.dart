import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/utils/api_url.dart';

void showQR(Gradient? gradient, String qrImage, String noMember, String contact) {
  Get.dialog(
    AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
        height: 300,
        width: 300,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: gradient,
        ),
        child: Center(
          child: Column(
            children: [
              const BaseText(
                text: 'Kode QR Saya',
                size: 18,
                bold: FontWeight.w600,
              ),
              Expanded(
                child: Image.network(
                  '${ApiUrl.baseStorageUrl}/${StorageUrl.qr}/$qrImage.png',
                  fit: BoxFit.cover,
                ),
              ),
              BaseText(
                text: noMember,
                bold: FontWeight.w600,
              ),
              BaseText(
                text: contact,
                bold: FontWeight.w600,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
