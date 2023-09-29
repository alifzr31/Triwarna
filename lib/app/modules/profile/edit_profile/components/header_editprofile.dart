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
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Obx(
          () => InkWell(
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
                  radius: 45,
                  foregroundColor: purpleColor,
                  backgroundImage: userController.profile.value?.image == null
                      ? null
                      : Image.network(
                              '${ApiUrl.baseStorageUrl}/profile/${userController.profile.value?.image}')
                          .image,
                  child: userController.profile.value?.image == null
                      ? Icon(
                          EvaIcons.person,
                          size: 60,
                        )
                      : null,
                ),
                if (controller.profileImage.value != null)
                  CircleAvatar(
                    backgroundImage: Image.file(
                            File(controller.profileImage.value?.path ?? ''))
                        .image,
                    radius: 45,
                  ),
                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.3),
                  radius: 45,
                  foregroundColor: Colors.white,
                  child: const BaseText(
                    text: 'Pilih\nFoto',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
