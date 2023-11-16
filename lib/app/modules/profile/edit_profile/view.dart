import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/modules/profile/controller.dart';
import 'package:triwarna_rebuild/app/modules/profile/edit_profile/components/appbar_editprofile.dart';
import 'package:triwarna_rebuild/app/modules/profile/edit_profile/widgets/accountinfo_profile.dart';
import 'package:triwarna_rebuild/app/modules/profile/edit_profile/widgets/header_editprofile.dart';
import 'package:triwarna_rebuild/app/modules/profile/edit_profile/widgets/personalinfo_profile.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarEditProfile(
        preferredSize: const Size.fromHeight(kToolbarHeight),
      ),
      body: EditProfileBody(),
    );
  }
}

class EditProfileBody extends StatelessWidget {
  EditProfileBody({super.key});
  final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: Get.height - 98,
        width: Get.width,
        child: Obx(
          () => Form(
            key: controller.formKeyEditProfil.value,
            child: Column(
              children: [
                HeaderEditProfile(),
                AccountInfoProfile(),
                PersonalInfoProfile(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
