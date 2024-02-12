import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_shimmer.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/app_helpers.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';

class PointVoucherBox extends StatelessWidget {
  const PointVoucherBox({
    super.key,
    required this.totalPoint,
    required this.totalVoucher,
    this.token,
  });

  final String totalPoint;
  final String totalVoucher;
  final String? token;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.white,
      elevation: 3,
      surfaceTintColor: Colors.white,
      clipBehavior: Clip.antiAlias,
      child: token == null
          ? InkWell(
              onTap: () => Get.toNamed('/login'),
              child: const Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: softPurpleColor,
                      foregroundColor: purpleColor,
                      child: Icon(EvaIcons.person),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Center(
                        child: BaseText(
                          text: 'Silahkan log in untuk melihat informasi',
                          color: purpleColor,
                          bold: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Get.toNamed('/point');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/point_icon.svg',
                            width: 30,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                const BaseText(
                                  text: 'Poin Anda',
                                  bold: FontWeight.w600,
                                ),
                                totalPoint == ''
                                    ? BaseShimmer(
                                        child: Container(
                                          height: 14,
                                          width: 60,
                                          margin: const EdgeInsets.only(
                                            top: 4,
                                            bottom: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(3),
                                          ),
                                        ),
                                      )
                                    : BaseText(
                                        text: AppHelpers.thousandFormat(
                                            int.parse(totalPoint))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 1,
                  color: Colors.grey.shade300,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Get.toNamed('/voucher');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                const BaseText(
                                  text: 'Voucher Anda',
                                  bold: FontWeight.w600,
                                ),
                                totalVoucher == ''
                                    ? BaseShimmer(
                                        child: Container(
                                          height: 14,
                                          width: 60,
                                          margin: const EdgeInsets.only(
                                            top: 4,
                                            bottom: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(3),
                                          ),
                                        ),
                                      )
                                    : BaseText(
                                        text: AppHelpers.thousandFormat(
                                            int.parse(totalVoucher))),
                              ],
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/images/voucher.svg',
                            width: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
