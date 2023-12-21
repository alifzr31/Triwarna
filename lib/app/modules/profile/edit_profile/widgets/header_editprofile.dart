import 'dart:io';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/utils/api_url.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';
import 'package:triwarna_rebuild/app/modules/profile/controller.dart';

class HeaderEditProfile extends StatelessWidget {
  HeaderEditProfile({super.key});
  final controller = Get.find<ProfileController>();
  final userController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          if (userController.profile.value?.contact == null)
            Container(
              width: Get.width,
              color: Colors.blue.shade100,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
              child: Center(
                child: BaseText(
                  text:
                      'Pastikan No. telepon sudah benar karena hanya bisa di isi 1 kali',
                  size: 13,
                  textAlign: TextAlign.center,
                  color: Colors.blue.shade800,
                  bold: FontWeight.w500,
                ),
              ),
            ),
          Obx(
            () => Center(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        final ImagePicker picker = ImagePicker();
                        controller.profileImage.value = await picker.pickImage(
                          source: ImageSource.gallery,
                          imageQuality: 60,
                        );

                        if (controller.profileImage.value != null) {
                          controller.showImage.value = true;
                        }
                      },
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            foregroundColor: purpleColor,
                            backgroundColor:
                                userController.profile.value?.image == null
                                    ? softPurpleColor
                                    : null,
                            backgroundImage:
                                userController.profile.value?.image == null
                                    ? null
                                    : Image.network(
                                        '${ApiUrl.baseStorageUrl}/profile/${userController.profile.value?.image}',
                                        loadingBuilder: (BuildContext context,
                                            Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          return loadingProgress == null
                                              ? child
                                              : Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    value: loadingProgress
                                                                .expectedTotalBytes !=
                                                            null
                                                        ? loadingProgress
                                                                .cumulativeBytesLoaded /
                                                            (loadingProgress
                                                                    .expectedTotalBytes ??
                                                                1)
                                                        : null,
                                                  ),
                                                );
                                        },
                                      ).image,
                            child: userController.profile.value?.image == null
                                ? const Icon(
                                    EvaIcons.person,
                                    size: 60,
                                  )
                                : null,
                          ),
                          if (controller.profileImage.value != null)
                            CircleAvatar(
                              backgroundImage: Image.file(
                                File(controller.profileImage.value?.path ?? ''),
                              ).image,
                              radius: 40,
                            ),
                          CircleAvatar(
                            backgroundColor: Colors.black.withOpacity(0.2),
                            radius: 40,
                            foregroundColor: Colors.white,
                            child: const Icon(
                              Icons.photo_camera_outlined,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const BaseText(
                      text: 'Ubah Foto',
                      size: 16,
                      bold: FontWeight.w600,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
