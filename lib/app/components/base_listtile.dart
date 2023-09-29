import 'package:flutter/material.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';

class BaseListTile extends StatelessWidget {
  const BaseListTile({
    Key? key,
    this.leading,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.onTap,
  }) : super(key: key);

  final Widget? leading;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
      horizontalTitleGap: 15,
      leading: leading,
      title: BaseText(
        text: title,
        size: 15,
        bold: FontWeight.w600,
      ),
      subtitle: BaseText(
        text: subtitle,
        size: 13,
        color: Colors.grey.shade600,
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
