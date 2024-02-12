import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';

class HeaderDashboard extends StatelessWidget {
  const HeaderDashboard({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: Get.width,
      color: purpleColor,
      child: Center(child: child),
    );
  }
}
