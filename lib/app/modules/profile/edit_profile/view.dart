import 'package:flutter/material.dart';
import 'package:triwarna_rebuild/app/components/base_appbar.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/profile/edit_profile/components/form_editprofile.dart';
import 'package:triwarna_rebuild/app/modules/profile/edit_profile/components/header_editprofile.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        bgColor: softPurpleColor,
        fgColor: purpleColor,
        title: 'Edit Profil',
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: Column(
        children: [
          HeaderEditProfile(),
          FormEditProfile(),
        ],
      ),
    );
  }
}
