import 'package:flutter/material.dart';
import 'package:triwarna_rebuild/app/components/base_appbar.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/onboard/components/footer_onboard.dart';
import 'package:triwarna_rebuild/app/modules/onboard/components/page_onboard.dart';

class OnBoardPage extends StatelessWidget {
  const OnBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: const BaseAppBar(
        bgColor: purpleColor,
        title: '',
        preferredSize: Size.zero,
      ),
      body: Column(
        children: [
          PageOnBoard(),
          FooterOnboard(),
        ],
      ),
    );
  }
}
