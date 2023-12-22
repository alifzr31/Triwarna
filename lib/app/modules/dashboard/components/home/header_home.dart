import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_shimmer.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/components/pointvoucher_box.dart';
import 'package:triwarna_rebuild/app/core/utils/api_url.dart';
import 'package:triwarna_rebuild/app/core/values/app_helpers.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/home/menu_header.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/member_progress.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/show_qr.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';

class HeaderHome extends StatelessWidget {
  HeaderHome({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: controller.token.value == null ? 235 : 375,
        width: Get.width,
        child: Stack(
          children: [
            Container(
              height: 170,
              width: Get.width,
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 70),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    softPurpleColor,
                    purpleColor,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const BaseText(
                              text: 'Halo, ',
                              size: 16,
                            ),
                            controller.token.value == null
                                ? const BaseText(
                                    text: 'Triwarna People',
                                    size: 16,
                                    bold: FontWeight.w600,
                                  )
                                : controller.profile.value == null
                                    ? BaseShimmer(
                                        child: Container(
                                          height: 16,
                                          width: 160,
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(3),
                                          ),
                                        ),
                                      )
                                    : BaseText(
                                        text: controller.profile.value?.name ??
                                            '',
                                        size: 16,
                                        bold: FontWeight.w600,
                                      ),
                          ],
                        ),
                        // RichText(
                        //   maxLines: 1,
                        //   overflow: TextOverflow.ellipsis,
                        //   text: TextSpan(
                        //     style: DefaultTextStyle.of(context).style,
                        //     children: [
                        //       const TextSpan(
                        //         text: 'Halo, ',
                        //         style: TextStyle(fontSize: 16),
                        //       ),
                        //       controller.token.value == null
                        //           ? const TextSpan(
                        //               text: 'Triwarna People',
                        //               style: TextStyle(
                        //                 fontWeight: FontWeight.w600,
                        //               ),
                        //             )
                        //           : TextSpan(
                        //               text: controller.profile.value?.name,
                        //               style: const TextStyle(
                        //                 fontSize: 16,
                        //                 fontWeight: FontWeight.w600,
                        //               ),
                        //             ),
                        //     ],
                        //   ),
                        // ),
                        const SizedBox(height: 5),
                        controller.token.value == null
                            ? const BaseText(
                                text:
                                    'Bergabung bersama kami, dan dapatkan berbagai hadiah menarik',
                                bold: FontWeight.w500,
                              )
                            : RichText(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: const [
                                    TextSpan(
                                      text:
                                          'Redeem point untuk mendapatkan hadiah sampai\ndengan ',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    TextSpan(
                                      text: 'MOTOR!',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                  if (controller.profile.value != null)
                    InkWell(
                      onTap: () {
                        showQR(controller.profile.value?.noMember ?? '');
                      },
                      child: Image.network(
                        '${ApiUrl.baseStorageUrl}/${StorageUrl.qr}/${controller.profile.value?.noMember}.png',
                        width: 70,
                      ),
                    ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: controller.token.value == null ? null : 240,
                width: Get.width,
                padding: controller.token.value == null
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
                    if (controller.token.value != null)
                      const SizedBox(height: 5),
                    if (controller.token.value != null)
                      controller.profile.value == null
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
                          : controller.profile.value?.loyalty?.toLowerCase() ==
                                  'platinum'
                              ? const BaseText(
                                  text:
                                      'Selamat 🎉 anda mencapai level member tertinggi',
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
                                          text: controller
                                                      .profile.value?.loyalty
                                                      ?.toLowerCase() ==
                                                  'silver'
                                              ? AppHelpers.rupiahFormat(
                                                  10000000 -
                                                      int.parse(controller
                                                              .profile
                                                              .value
                                                              ?.spendingTotal ??
                                                          '0'))
                                              : AppHelpers.rupiahFormat(
                                                  100000000 -
                                                      int.parse(controller
                                                              .profile
                                                              .value
                                                              ?.spendingTotal ??
                                                          '0')),
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const TextSpan(
                                          text:
                                              ' lagi untuk menaikkan\nlevel membermu',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ]),
                                ),
                    if (controller.token.value != null)
                      const SizedBox(height: 5),
                    if (controller.token.value != null)
                      MemberProgress(
                        category:
                            controller.profile.value?.loyalty?.toLowerCase() ??
                                '',
                        currentTransaction: int.parse(
                            controller.profile.value?.spendingTotal ?? '0'),
                      ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: controller.token.value == null ? 80 : 85,
              left: 0,
              right: 0,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: PointVoucherBox(
                    totalPoint: controller.profile.value == null
                        ? ''
                        : AppHelpers.thousandFormat(int.parse(
                            controller.profile.value?.loyaltyPoint ?? '0')),
                    totalVoucher: controller.profile.value == null
                        ? ''
                        : AppHelpers.thousandFormat(int.parse(
                            controller.profile.value?.voucherTotal ?? '0')),
                    token: controller.token.value,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
