import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:triwarna_rebuild/app/core/utils/api_url.dart';

void showPictProfile(String image) {
  Get.dialog(
    Center(
      child: SizedBox(
        height: Get.height * 0.65,
        width: Get.width * 0.65,
        child: PhotoView(
          imageProvider: Image.network(
                  '${ApiUrl.baseStorageUrl}${StorageUrl.profile}/$image')
              .image,
          backgroundDecoration: const BoxDecoration(
            color: Colors.transparent,
          ),
        ),
      ),
    ),
  );
}
