import 'package:flutter/material.dart';
import 'package:triwarna_rebuild/app/components/base_appbar.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/profile/change_password/components/form_changepass.dart';

class ChangePassPage extends StatelessWidget {
  const ChangePassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        bgColor: softPurpleColor,
        fgColor: purpleColor,
        title: 'Ganti Password',
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: FormChangePass(),
    );
  }
}
