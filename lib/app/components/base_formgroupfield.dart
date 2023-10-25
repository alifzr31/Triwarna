import 'package:flutter/material.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';

class BaseFormGroupField extends StatelessWidget {
  const BaseFormGroupField({
    Key? key,
    this.controller,
    required this.label,
    this.hint,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.onTap,
    this.readOnly = false,
    this.autofocus = false,
    this.onChanged,
    this.initialValue,
    this.helper,
  }) : super(key: key);

  final TextEditingController? controller;
  final String label;
  final String? hint;
  final String? helper;
  final String? initialValue;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final bool readOnly;
  final bool autofocus;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final void Function(String?)? onChanged;

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
          obscureText: obscureText,
          keyboardType: keyboardType,
          initialValue: initialValue,
          readOnly: readOnly,
          autofocus: autofocus,
          validator: validator,
          onChanged: onChanged,
          onTap: onTap,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            hintText: hint,
            helperText: helper,
            helperStyle: const TextStyle(
              color: Colors.red,
              fontStyle: FontStyle.italic,
            ),
            contentPadding: const EdgeInsets.all(15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}

class BaseFormGroupFieldAuth extends StatelessWidget {
  const BaseFormGroupFieldAuth({
    Key? key,
    this.controller,
    required this.label,
    this.hint,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.onTap,
    this.readOnly = false,
    this.autofocus = false,
    this.onChanged,
    this.initialValue,
    this.helper,
  }) : super(key: key);

  final TextEditingController? controller;
  final String label;
  final String? hint;
  final String? helper;
  final String? initialValue;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final bool readOnly;
  final bool autofocus;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: BaseText(
            text: label,
            bold: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          initialValue: initialValue,
          readOnly: readOnly,
          autofocus: autofocus,
          validator: validator,
          onChanged: onChanged,
          onTap: onTap,
          style: TextStyle(
            color: Colors.white,
          ),
          cursorColor: Colors.grey.shade500,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            hintText: hint,
            helperText: helper,
            hintStyle: TextStyle(
              color: Colors.grey.shade500
            ),
            helperStyle: const TextStyle(
              color: yellowColor,
              fontStyle: FontStyle.italic,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.white,
                width: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}