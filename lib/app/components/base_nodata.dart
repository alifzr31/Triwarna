import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:triwarna_rebuild/app/components/base_button.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';

class BaseNoData extends StatelessWidget {
  const BaseNoData({
    Key? key,
    required this.label,
    required this.labelButton,
    this.onPressed,
  }) : super(key: key);

  final String label;
  final String labelButton;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/logo.svg',
            width: 160,
          ),
          const SizedBox(height: 20),
          BaseText(text: label, size: 18, bold: FontWeight.w500),
          BaseOutlineButtonIcon(
            borderColor: purpleColor,
            fgColor: purpleColor,
            icon: Icons.refresh,
            label: labelButton,
            onPressed: onPressed,
          )
        ],
      ),
    );
  }
}
