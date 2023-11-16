import 'package:flutter/material.dart';
import 'package:triwarna_rebuild/app/components/base_appbar.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/forgot_pin/reset_pin/widgets/resetpin_body.dart';

class ResetPinPage extends StatelessWidget {
  const ResetPinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        bgColor: purpleColor,
        fgColor: Colors.white,
        title: 'Reset PIN',
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: ResetPinBody(),
    );
  }
}
