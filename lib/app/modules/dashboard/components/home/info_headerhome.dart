import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_shimmer.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/app_helpers.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/home/menu_header.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/member_progress.dart';

class InfoHeaderHome extends StatelessWidget {
  const InfoHeaderHome({
    Key? key,
    required this.category,
    required this.spendingTotal,
    this.token,
  }) : super(key: key);

  final String category;
  final String spendingTotal;
  final String? token;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: token == null ? null : 240,
      width: Get.width,
      padding: token == null
          ? const EdgeInsets.fromLTRB(15, 45, 15, 15)
          : const EdgeInsets.fromLTRB(15, 45, 15, 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const MenuHeader(),
          if (token != null) const SizedBox(height: 5),
          if (token != null)
            category == ''
                ? BaseShimmer(
                    child: Column(
                      children: [
                        Container(
                          height: 13,
                          width: 290,
                          margin: const EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                        Container(
                          height: 13,
                          width: 100,
                          margin: const EdgeInsets.only(bottom: 2),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ],
                    ),
                  )
                : category == 'platinum'
                    ? const BaseText(
                        text: 'Selamat 🎉 anda mencapai level member tertinggi',
                        bold: FontWeight.w500,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )
                    : RichText(
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: [
                              const TextSpan(
                                text: 'Yuk! Belanja ',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: category == 'silver'
                                    ? AppHelpers.rupiahFormat(
                                        10000000 - int.parse(spendingTotal))
                                    : AppHelpers.rupiahFormat(
                                        100000000 - int.parse(spendingTotal)),
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const TextSpan(
                                text: ' lagi untuk menaikkan\nlevel membermu',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ]),
                      ),
          if (token != null) const SizedBox(height: 5),
          if (token != null)
            MemberProgress(
              category: category,
              currentTransaction: int.parse(spendingTotal),
            ),
        ],
      ),
    );
  }
}
