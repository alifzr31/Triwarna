import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_shimmer.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/utils/api_url.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';

class CardVoucher extends StatelessWidget {
  const CardVoucher({
    Key? key,
    required this.qrImage,
    required this.namaBarang,
    required this.serialNumber,
    required this.status,
    required this.medalImage,
    this.bgColor,
    this.onTap,
  }) : super(key: key);

  final String qrImage;
  final String namaBarang;
  final String serialNumber;
  final String status;
  final String medalImage;
  final Color? bgColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(
            height: 100,
            width: Get.width,
            color: bgColor,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.network(
                      '${ApiUrl.baseStorageUrl}/qr/points/$qrImage'),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BaseText(
                          text: namaBarang,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          bold: FontWeight.w600,
                          color: bgColor == purpleColor
                              ? Colors.white
                              : purpleColor,
                        ),
                        const SizedBox(height: 3),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: bgColor == purpleColor
                                ? softPurpleColor
                                : purpleColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: BaseText(
                            text: serialNumber,
                            bold: FontWeight.w500,
                            color: bgColor == purpleColor
                                ? purpleColor
                                : softPurpleColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: Stack(
                    children: [
                      const Positioned(
                        top: -30,
                        right: -12,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Color(0xFFbdb2cd),
                        ),
                      ),
                      Positioned(
                        top: 3,
                        right: 16,
                        child: SvgPicture.asset(
                          'assets/images/$medalImage',
                          width: 28,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: BaseText(
                    text: status,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    color: Colors.grey.shade600,
                    bold: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 10),
                InkResponse(
                  onTap: onTap,
                  child: const BaseText(
                    text: 'Lihat Detail',
                    color: purpleColor,
                    bold: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardVoucherLoading extends StatelessWidget {
  const CardVoucherLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseShimmer(
      child: Card(
        color: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.only(bottom: 10),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Container(
              height: 100,
              width: Get.width,
              color: softPurpleColor,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 14,
                            width: 100,
                          ),
                          Container(
                            height: 14,
                            width: 100,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: purpleColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 80,
                    child: Stack(
                      children: [
                        const Positioned(
                          top: -30,
                          right: -12,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: Color(0xFFbdb2cd),
                          ),
                        ),
                        Positioned(
                          top: 3,
                          right: 16,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 14,
                      width: 100,
                    ),
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    height: 14,
                    width: 100,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
