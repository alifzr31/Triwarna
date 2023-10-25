import 'package:flutter/material.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';

class LevelLabel extends StatelessWidget {
  const LevelLabel({
    Key? key,
    this.labelColor,
    this.labelGradient,
  }) : super(key: key);

  final Color? labelColor;
  final Gradient? labelGradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: labelColor,
        gradient: labelGradient,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: const BaseText(
        text: 'Level Saat Ini',
        size: 11,
        bold: FontWeight.w500,
        color: Colors.white,
      ),
    );
  }
}
