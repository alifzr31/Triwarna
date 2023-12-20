import 'package:flutter/material.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';

class WinnerCustomer extends StatelessWidget {
  const WinnerCustomer({
    Key? key,
    required this.name,
    required this.branch,
    this.searchCustomer,
  }) : super(key: key);

  final String name;
  final String branch;
  final String? searchCustomer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: name.toLowerCase() == searchCustomer.toString().toLowerCase()
          ? const EdgeInsets.symmetric(horizontal: 8, vertical: 6)
          : null,
      margin: name.toLowerCase() == searchCustomer.toString().toLowerCase()
          ? const EdgeInsets.symmetric(vertical: 5)
          : null,
      decoration: name.toLowerCase() == searchCustomer.toString().toLowerCase()
          ? BoxDecoration(
              color: softPurpleColor.withOpacity(0.6),
              borderRadius: BorderRadius.circular(5),
            )
          : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: BaseText(
              text: name,
              size: 12,
              color:
                  name.toLowerCase() == searchCustomer.toString().toLowerCase()
                      ? purpleColor
                      : null,
              bold:
                  name.toLowerCase() == searchCustomer.toString().toLowerCase()
                      ? FontWeight.w600
                      : FontWeight.w500,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: BaseText(
                text: branch,
                size: 12,
                color: name.toLowerCase() ==
                        searchCustomer.toString().toLowerCase()
                    ? purpleColor
                    : null,
                bold: name.toLowerCase() ==
                        searchCustomer.toString().toLowerCase()
                    ? FontWeight.w600
                    : FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
