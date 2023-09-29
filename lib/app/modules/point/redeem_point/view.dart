import 'package:flutter/material.dart';
import 'package:triwarna_rebuild/app/components/base_appbar.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/point/components/redeem_point/header_redeempoint.dart';
import 'package:triwarna_rebuild/app/modules/point/components/redeem_point/list_prize.dart';

class RedeemPointPage extends StatelessWidget {
  const RedeemPointPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        bgColor: softPurpleColor,
        fgColor: purpleColor,
        title: 'Tukar Poin',
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: Column(
        children: [
          HeaderRedeemPoint(),
          ListPrize(),
        ],
      ),
    );
  }
}
