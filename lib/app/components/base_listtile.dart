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
    this.tileColor,
  }) : super(key: key);

  final Widget? leading;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final void Function()? onTap;
  final Color? tileColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
      horizontalTitleGap: 15,
      tileColor: tileColor,
      leading: leading,
      title: BaseText(
        text: title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
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

class BaseListTileRichText extends StatelessWidget {
  const BaseListTileRichText({
    Key? key,
    this.leading,
    required this.richTitle,
    required this.subtitle,
    this.trailing,
    this.onTap,
    this.tileColor,
  }) : super(key: key);

  final Widget? leading;
  final List<InlineSpan> richTitle;
  final String subtitle;
  final Widget? trailing;
  final void Function()? onTap;
  final Color? tileColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
      horizontalTitleGap: 15,
      tileColor: tileColor,
      leading: leading,
      title: RichText(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: richTitle,
        ),
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
