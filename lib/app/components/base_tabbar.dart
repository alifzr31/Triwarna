import 'package:flutter/material.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';

class BaseTabBar extends StatelessWidget {
  const BaseTabBar({
    Key? key,
    required this.tabs,
    this.onTap,
  }) : super(key: key);

  final List<Widget> tabs;
  final void Function(int)? onTap;  

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: onTap,
      labelPadding: const EdgeInsets.symmetric(vertical: 10),
      indicatorSize: TabBarIndicatorSize.tab,
      unselectedLabelStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      labelStyle: const TextStyle(
        color: purpleColor,
        fontWeight: FontWeight.w600,
      ),
      tabs: tabs,
    );
  }
}
