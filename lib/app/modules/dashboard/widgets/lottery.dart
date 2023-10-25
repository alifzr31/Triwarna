import 'package:flutter/material.dart';
import 'package:triwarna_rebuild/app/components/base_appbar.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/header_dashboard.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/lottery/body_lottery.dart';

class LotteryTab extends StatelessWidget {
  const LotteryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const BaseAppBar(
        bgColor: softPurpleColor,
        title: '',
        preferredSize: Size.zero,
      ),
      body: Column(
        children: [
          const HeaderDashboard(
            child: BaseText(
              text: 'Undian',
              size: 26,
              color: purpleColor,
              bold: FontWeight.w600,
            ),
          ),
          BodyLottery(),
        ],
      ),
    );
  }
}
