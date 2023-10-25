import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({
    Key? key,
    required this.title,
    required this.preferredSize,
    this.action,
    this.bottom,
    this.bgColor,
    this.fgColor,
  }) : super(key: key);

  final String title;
  final Size preferredSize;
  final List<Widget>? action;
  final PreferredSizeWidget? bottom;
  final Color? bgColor;
  final Color? fgColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // forceMaterialTransparency: true,
      scrolledUnderElevation: 0,
      title: BaseText(
        text: title,
        bold: FontWeight.w500,
      ),
      centerTitle: true,
      elevation: 0,
      shadowColor: softPurpleColor,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(Icons.arrow_back_ios_new),
      ),
      backgroundColor: bgColor,
      foregroundColor: fgColor,
      bottom: bottom,
      actions: action,
    );
  }
}
