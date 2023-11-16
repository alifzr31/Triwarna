import 'package:flutter/material.dart';
import 'package:triwarna_rebuild/app/components/base_appbar.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/profile/pin/change_pin/components/form_changepin.dart';

class ChangePinPage extends StatelessWidget {
  const ChangePinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        bgColor: purpleColor,
        fgColor: Colors.white,
        title: 'Ganti PIN',
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: FormChangePin(),
    );
  }
}