import 'package:flutter/material.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';

class BaseTextArea extends StatelessWidget {
  const BaseTextArea({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
    this.maxLines,
    this.validator,
    this.enabled = true,
    this.keyboardType,
  });

  final String label;
  final String hint;
  final TextEditingController? controller;
  final int? maxLines;
  final TextInputType? keyboardType;
  final bool enabled;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: BaseText(
            text: label,
            bold: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          enabled: enabled,
          keyboardType: keyboardType,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            contentPadding: const EdgeInsets.all(10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
