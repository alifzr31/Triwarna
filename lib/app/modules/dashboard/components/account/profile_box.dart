import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_button.dart';
import 'package:triwarna_rebuild/app/components/base_shimmer.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/utils/api_url.dart';
import 'package:triwarna_rebuild/app/core/values/app_helpers.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/core/values/gradients.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/show_qr.dart';

class ProfileBox extends StatelessWidget {
  const ProfileBox({
    super.key,
    required this.name,
    required this.noMember,
    required this.totalPoint,
    required this.totalVoucher,
    required this.category,
    required this.totalTransaction,
    required this.memberProgress,
  });

  final String name;
  final String noMember;
  final String totalPoint;
  final String totalVoucher;
  final String category;
  final String totalTransaction;
  final Widget memberProgress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 435,
      width: Get.width,
      child: Material(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        bottom: 15,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          name == ''
                              ? BaseShimmer(
                                  child: Container(
                                    height: 15,
                                    width: 150,
                                    margin: const EdgeInsets.only(bottom: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                  ),
                                )
                              : BaseText(
                                  text: name,
                                  bold: FontWeight.w600,
                                ),
                          category == ''
                              ? BaseShimmer(
                                  child: Container(
                                    height: 23,
                                    width: 70,
                                    margin: const EdgeInsets.only(bottom: 0),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                )
                              : Container(
                                  width: 70,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 3),
                                  decoration: BoxDecoration(
                                    gradient: category == 'silver'
                                        ? GradientColor.silver
                                        : category == 'gold'
                                            ? GradientColor.gold
                                            : GradientColor.platinum,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  child: Center(
                                    child: BaseText(
                                      text: category.capitalize ?? '',
                                      size: 12,
                                      color: category == 'platinum'
                                          ? Colors.grey.shade500
                                          : Colors.white,
                                      bold: FontWeight.w600,
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                  noMember == ''
                      ? BaseShimmer(
                          child: Container(
                            height: 50,
                            width: 50,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        )
                      : InkResponse(
                          onTap: () => showQR(noMember),
                          child: Image.network(
                            '${ApiUrl.baseStorageUrl}/qr/members/$noMember.png',
                            height: 70,
                            width: 70,
                            loadingBuilder: (context, child, loadingProgress) {
                              return loadingProgress == null
                                  ? child
                                  : Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                (loadingProgress
                                                        .expectedTotalBytes ??
                                                    1)
                                            : null,
                                      ),
                                    );
                            },
                          ),
                        ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: Get.width,
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.fromLTRB(15, 45, 15, 15),
                decoration: const BoxDecoration(
                  color: softPurpleColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    const Card(
                      margin: EdgeInsets.zero,
                      shape: StadiumBorder(),
                      color: softPurpleColor,
                      elevation: 2,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                        child: BaseText(
                          text: 'TRIWARNA MEDAL JOURNEY',
                          size: 16,
                          bold: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    noMember == ''
                        ? Column(
                            children: [
                              BaseShimmer(
                                child: Container(
                                  height: 15,
                                  width: Get.width,
                                  margin: const EdgeInsets.only(bottom: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                              ),
                              BaseShimmer(
                                child: Container(
                                  height: 15,
                                  width: 110,
                                  margin: const EdgeInsets.only(bottom: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: [
                                const TextSpan(text: 'Yuk! Belanja '),
                                TextSpan(
                                  text: category == 'silver'
                                      ? AppHelpers.rupiahFormat(10000000 -
                                          int.parse(totalTransaction))
                                      : category == 'gold'
                                          ? AppHelpers.rupiahFormat(100000000 -
                                              int.parse(totalTransaction))
                                          : null,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600),
                                ),
                                const TextSpan(
                                    text: ' lagi untuk mencapai\nlevel '),
                                TextSpan(
                                  text: category == 'silver'
                                      ? 'Gold'
                                      : 'Platinum',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                    const SizedBox(height: 15),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BaseText(
                                text: 'Total Transaksi',
                                size: 12,
                                color: Colors.grey.shade600,
                              ),
                              noMember == ''
                                  ? BaseShimmer(
                                      child: Container(
                                        height: 17,
                                        width: 150,
                                        margin:
                                            const EdgeInsets.only(bottom: 5),
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                      ),
                                    )
                                  : Expanded(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: BaseText(
                                          text: AppHelpers.rupiahFormat(
                                              int.parse(totalTransaction)),
                                          size: 16,
                                          bold: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                          memberProgress,
                          SizedBox(
                            width: Get.width,
                            child: BaseButton(
                              bgColor: purpleColor,
                              fgColor: Colors.white,
                              label: 'Lihat Semua Benefit',
                              onPressed: () => Get.toNamed('/benefit'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
