import 'package:flutter/material.dart';
import 'package:triwarna_rebuild/app/modules/onboard/components/footer_onboard.dart';
import 'package:triwarna_rebuild/app/modules/onboard/components/page_onboard.dart';

class OnBoardPage extends StatelessWidget {
  const OnBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PageOnBoard(),
          FooterOnboard(),
        ],
      ),
    );
  }
}
