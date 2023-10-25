import 'package:flutter/material.dart';
import 'package:triwarna_rebuild/app/components/base_appbar.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/point/history_point/widgets/historypoint_body.dart';

class HistoryPointPage extends StatelessWidget {
  const HistoryPointPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        bgColor: softPurpleColor,
        fgColor: purpleColor,
        title: 'Riwayat Poin',
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: HistoryPointBody(),
    );
  }
}
