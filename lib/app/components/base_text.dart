import 'package:flutter/material.dart';

class BaseText extends StatelessWidget {
  const BaseText({
    Key? key,
    required this.text,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.size,
    this.color,
    this.bold,
    this.fontFamily,
  }) : super(key: key);

  final String text;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? size;
  final Color? color;
  final FontWeight? bold;
  final String? fontFamily;


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: bold,
        fontFamily: fontFamily,
      ),
    );
  }
}