import 'package:flutter/material.dart';
import 'package:triwarna_rebuild/app/components/base_appbar.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/pin_input/components/pin_number.dart';

class PinInputPage extends StatelessWidget {
  const PinInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        bgColor: baseBgScaffold,
        fgColor: purpleColor,
        title: 'Masukkan PIN Anda',
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: PinNumber(),
    );
  }
}
