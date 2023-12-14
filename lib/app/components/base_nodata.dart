import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';

class BaseNoData extends StatelessWidget {
  const BaseNoData({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.labelButton,
    this.onPressed,
  }) : super(key: key);

  final String image;
  final String title;
  final String subtitle;
  final String labelButton;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/$image',
            width: 80,
          ),
          const SizedBox(height: 10),
          BaseText(
            text: title,
            size: 16,
            bold: FontWeight.w500,
            textAlign: TextAlign.center,
          ),
          BaseText(
            text: subtitle,
            textAlign: TextAlign.center,
            color: Colors.grey.shade600,
          ),
          TextButton.icon(
            onPressed: onPressed,
            icon: const Icon(Icons.refresh),
            label: BaseText(text: labelButton),
          ),
        ],
      ),
    );
  }
}
