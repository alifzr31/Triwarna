import 'package:flutter/material.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';

class ItemField extends StatelessWidget {
  const ItemField({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BaseText(
          text: label,
          color: purpleColor,
          bold: FontWeight.w600,
        ),
        const SizedBox(height: 5),
        BaseText(
          text: value,
          color: Colors.grey.shade600,
          bold: FontWeight.w600,
        ),
      ],
    );
  }
}
