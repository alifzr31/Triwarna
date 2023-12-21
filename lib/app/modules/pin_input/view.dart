import 'package:flutter/material.dart';
import 'package:triwarna_rebuild/app/components/base_appbar.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/pin_input/widgets/pin_body.dart';
import 'package:triwarna_rebuild/app/modules/pin_input/widgets/pin_header.dart';

class PinInputPage extends StatelessWidget {
  const PinInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        bgColor: purpleColor,
        fgColor: Colors.white,
        title: 'Tukar Poin',
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: Column(
        children: [
          PinHeader(),
          PinBody(),
        ],
      ),
    );
  }
}
