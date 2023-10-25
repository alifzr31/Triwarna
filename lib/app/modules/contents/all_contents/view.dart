import 'package:flutter/material.dart';
import 'package:triwarna_rebuild/app/components/base_appbar.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/contents/all_contents/components/body_contents.dart';

class ContentsPage extends StatelessWidget {
  const ContentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const BaseAppBar(
        bgColor: softPurpleColor,
        fgColor: purpleColor,
        title: 'Event dan Promo',
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: BodyContents(),
    );
  }
}
