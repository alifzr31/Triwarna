import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';

class MyPointCard extends StatelessWidget {
  const MyPointCard({
    Key? key,
    required this.loyaltyPoint,
  }) : super(key: key);

  final String loyaltyPoint;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 3,
        margin: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const BaseText(
                text: 'Poin Triwarna Anda',
                size: 16,
                bold: FontWeight.w600,
              ),
              const BaseText(
                text: 'Tukar poin anda dengan hadiah menarik',
                size: 12,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/point_icon.svg',
                            width: 30,
                          ),
                          Container(
                            width: 110,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: yellowColor,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Center(
                              child: RichText(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: [
                                    TextSpan(
                                      text: loyaltyPoint,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: ' Poin',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      BaseText(
                        text: '*Kadaluwarsa 31 Desember 2024',
                        color: Colors.grey.shade600,
                        size: 8,
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () => Get.toNamed('/historyPoint'),
                    child: const Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.history,
                            size: 20,
                          ),
                          SizedBox(width: 3),
                          BaseText(text: 'Riwayat Poin'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
