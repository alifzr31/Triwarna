import 'package:flutter/material.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';

class AnswerItem extends StatelessWidget {
  const AnswerItem({
    super.key,
    required this.answer,
    this.number,
  });

  final String answer;
  final String? number;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: BaseText(text: '$number.'),
        ),
        Expanded(
          flex: 20,
          child: BaseText(
            text: answer,
          ),
        ),
      ],
    );
  }
}
