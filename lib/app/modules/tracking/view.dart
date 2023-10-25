import 'package:flutter/material.dart';
import 'package:triwarna_rebuild/app/components/base_appbar.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/tracking/widgets/tracking_body.dart';
import 'package:triwarna_rebuild/app/modules/tracking/widgets/tracking_header.dart';

class TrackingPage extends StatelessWidget {
  const TrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        bgColor: softPurpleColor,
        fgColor: purpleColor,
        title: 'Lacak Hadiah Voucher',
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: Column(
        children: [
          TrackingHeader(),
          TrackingBody(),
        ],
      ),
    );
  }
}
