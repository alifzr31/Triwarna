import 'package:flutter/material.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';

class BenefitItem extends StatelessWidget {
  const BenefitItem({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          const Icon(Icons.check, size: 25, color: purpleColor),
          const SizedBox(width: 15),
          Expanded(
            child: BaseText(
              text: text,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}

class BenefitItemCustom extends StatelessWidget {
  const BenefitItemCustom({
    Key? key,
    required this.children,
  }) : super(key: key);

  final List<InlineSpan> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          const Icon(Icons.check, size: 25, color: purpleColor),
          const SizedBox(width: 15),
          Expanded(
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: children,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
