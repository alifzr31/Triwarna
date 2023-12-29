import 'package:flutter/material.dart';
import 'package:triwarna_rebuild/app/components/base_appbar.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/answer_faq/widgets/answerfaq_body.dart';

class AnswerFaqPage extends StatelessWidget {
  const AnswerFaqPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const BaseAppBar(
        bgColor: purpleColor,
        fgColor: Colors.white,
        title: 'Bantuan',
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: AnswerFaqBody(),
    );
  }
}
