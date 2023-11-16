import 'package:flutter/material.dart';
import 'package:triwarna_rebuild/app/components/base_appbar.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/profile/pin/create_pin/components/form_createpin.dart';

class CreatePinPage extends StatelessWidget {
  const CreatePinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        bgColor: purpleColor,
        fgColor: Colors.white,
        title: 'Buat PIN',
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: FormCreatePin(),
    );
  }
}
