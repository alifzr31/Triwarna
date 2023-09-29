import 'package:flutter/material.dart';
import 'package:triwarna_rebuild/app/components/base_appbar.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/detail_lottery/components/body_detaillottery.dart';

class DetailLotteryPage extends StatelessWidget {
  const DetailLotteryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BaseAppBar(
        bgColor: softPurpleColor,
        fgColor: purpleColor,
        title: 'Detail Undian',
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: BodyDetailLottery(),
    );
  }
}
