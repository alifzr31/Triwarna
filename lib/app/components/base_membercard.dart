import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseMemberCard extends StatelessWidget {
  const BaseMemberCard({
    Key? key,
    this.color,
    this.gradient,
    this.padding,
    required this.child,
  }) : super(key: key);

  final Color? color;
  final Gradient? gradient;
  final EdgeInsets? padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: Get.width,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        gradient: gradient,
      ),
      child: child,
    );
  }
}
