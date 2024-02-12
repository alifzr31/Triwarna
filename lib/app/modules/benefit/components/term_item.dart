import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';

class TermItem extends StatelessWidget {
  const TermItem({
    super.key,
    this.text,
  });

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 12,
              backgroundColor: Color(0xFFbaa9d0),
              foregroundColor: purpleColor,
              child: Icon(
                EvaIcons.star,
                size: 16,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: BaseText(
                text: text ?? '',
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
