import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';

class BenefitItem extends StatelessWidget {
  const BenefitItem({
    super.key,
    this.text,
    this.textChildren,
  });

  final String? text;
  final List<TextSpan>? textChildren;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 12,
              backgroundColor: softPurpleColor,
              foregroundColor: purpleColor,
              child: Icon(
                EvaIcons.checkmark,
                size: 16,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: text == null
                  ? RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: textChildren,
                      ),
                    )
                  : BaseText(
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
