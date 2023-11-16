import 'package:flutter/material.dart';
import 'package:triwarna_rebuild/app/components/base_appbar.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/benefit/widgets/body_benefit.dart';
import 'package:triwarna_rebuild/app/modules/benefit/widgets/header_benefit.dart';

class BenefitPage extends StatelessWidget {
  const BenefitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const BaseAppBar(
        bgColor: purpleColor,
        fgColor: Colors.white,
        title: 'Benefit Member',
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: Column(
        children: [
          HeaderBenefit(),
          BodyBenefit(),
        ],
      ),
    );
  }
}
