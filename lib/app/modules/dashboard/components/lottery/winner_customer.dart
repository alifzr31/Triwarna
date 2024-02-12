import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_shimmer.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';

class WinnerCustomer extends StatelessWidget {
  const WinnerCustomer({
    super.key,
    required this.name,
    required this.branch,
    required this.couponNumber,
    this.searchCustomer,
  });

  final String name;
  final String branch;
  final String couponNumber;
  final String? searchCustomer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: name.toLowerCase() == searchCustomer.toString().toLowerCase() ||
              couponNumber.toLowerCase() ==
                  searchCustomer.toString().toLowerCase()
          ? const EdgeInsets.symmetric(horizontal: 8, vertical: 6)
          : null,
      margin: name.toLowerCase() == searchCustomer.toString().toLowerCase() ||
              couponNumber.toLowerCase() ==
                  searchCustomer.toString().toLowerCase()
          ? const EdgeInsets.symmetric(vertical: 5)
          : const EdgeInsets.only(top: 5),
      decoration:
          name.toLowerCase() == searchCustomer.toString().toLowerCase() ||
                  couponNumber.toLowerCase() ==
                      searchCustomer.toString().toLowerCase()
              ? BoxDecoration(
                  color: softPurpleColor,
                  borderRadius: BorderRadius.circular(5),
                )
              : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: name == ''
                ? BaseShimmer(
                    child: Container(
                      height: 12,
                      margin: const EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BaseText(
                        text: name.capitalize ?? '',
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
                      const SizedBox(height: 2),
                      BaseText(
                        text: branch,
                        size: 12,
                        color: Colors.grey.shade600,
                      ),
                    ],
                  ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: couponNumber == ''
                  ? BaseShimmer(
                      child: Container(
                        height: 12,
                        margin: const EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    )
                  : BaseText(
                      text: couponNumber,
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
