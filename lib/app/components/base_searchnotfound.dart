import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';

class BaseSearchNotFound extends StatelessWidget {
  const BaseSearchNotFound({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/lotties/winner_notfound.json',
              width: 180,
              frameRate: const FrameRate(144),
              repeat: false,
            ),
            BaseText(
              text: title,
              textAlign: TextAlign.center,
              size: 16,
              bold: FontWeight.w500,
            ),
            BaseText(
              text: subtitle,
              textAlign: TextAlign.center,
              color: Colors.grey.shade600,
            ),
          ],
        ),
      ),
    );
  }
}
