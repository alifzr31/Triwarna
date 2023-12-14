import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:triwarna_rebuild/app/components/base_shimmer.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/components/pointvoucher_box.dart';
import 'package:triwarna_rebuild/app/core/utils/api_url.dart';
import 'package:triwarna_rebuild/app/core/values/app_helpers.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/core/values/gradients.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/home/show_qr.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/member_card.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';

class HeaderAccount extends StatelessWidget {
  HeaderAccount({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      color: Colors.white,
      padding: const EdgeInsets.all(15),
      child: Obx(
        () => Column(
          children: [
            controller.profile.value == null &&
                    controller.token.value != null &&
                    controller.noMember.value == null
                ? BaseShimmer(
                    child: MemberCard(
                      color: Colors.grey.shade300,
                      child: Container(),
                    ),
                  )
                : MemberCard(
                    gradient: controller.profile.value?.loyalty
                                ?.toLowerCase() ==
                            'silver'
                        ? GradientColor.silver
                        : controller.profile.value?.loyalty?.toLowerCase() ==
                                'gold'
                            ? GradientColor.gold
                            : GradientColor.platinum,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            controller.profile.value?.image !=
                                                    null
                                                ? InkWell(
                                                    onTap: () {
                                                      Get.dialog(
                                                        Center(
                                                          child: SizedBox(
                                                            height: Get.height *
                                                                0.7,
                                                            width:
                                                                Get.width * 0.7,
                                                            child: PhotoView(
                                                              imageProvider:
                                                                  Image.network(
                                                                          '${ApiUrl.baseStorageUrl}${StorageUrl.profile}/${controller.profile.value?.image}')
                                                                      .image,
                                                              backgroundDecoration:
                                                                  const BoxDecoration(
                                                                color: Colors
                                                                    .transparent,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: CircleAvatar(
                                                      radius: 35,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      backgroundImage:
                                                          Image.network(
                                                        '${ApiUrl.baseStorageUrl}${StorageUrl.profile}/${controller.profile.value?.image}',
                                                      ).image,
                                                    ),
                                                  )
                                                : const CircleAvatar(
                                                    radius: 35,
                                                    backgroundColor:
                                                        softPurpleColor,
                                                    foregroundColor:
                                                        purpleColor,
                                                    child: Center(
                                                      child: Icon(
                                                        EvaIcons.person,
                                                        size: 40,
                                                        color: purpleColor,
                                                      ),
                                                    ),
                                                  ),
                                            // controller.profile.value?.image !=
                                            //         null
                                            //     ? CircleAvatar(
                                            //         radius: 35,
                                            //         backgroundColor:
                                            //             Colors.transparent,
                                            //         backgroundImage: Image.network(
                                            //                 '${ApiUrl.baseStorageUrl}${StorageUrl.profile}/${controller.profile.value?.image}')
                                            //             .image,
                                            //       )
                                            //     : const CircleAvatar(
                                            //         radius: 35,
                                            //         child: Center(
                                            //           child: Icon(
                                            //             EvaIcons.person,
                                            //             size: 40,
                                            //             color: purpleColor,
                                            //           ),
                                            //         ),
                                            //       ),
                                            const SizedBox(width: 5),
                                            SvgPicture.asset(
                                              controller.profile.value?.loyalty
                                                          ?.toLowerCase() ==
                                                      'silver'
                                                  ? 'assets/images/silver_medal.svg'
                                                  : controller.profile.value
                                                              ?.loyalty
                                                              ?.toLowerCase() ==
                                                          'gold'
                                                      ? 'assets/images/gold_medal.svg'
                                                      : 'assets/images/platinum_medal.svg',
                                              width: 30,
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      BaseText(
                                        text: controller.profile.value?.name
                                                .toString()
                                                .capitalize ??
                                            '',
                                        size: 16,
                                        bold: FontWeight.w600,
                                      ),
                                      BaseText(
                                        text: controller.profile.value?.email ??
                                            '',
                                        color: Colors.grey.shade600,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                                if (controller.profile.value != null)
                                  InkWell(
                                    onTap: () {
                                      showQR(
                                        controller.profile.value?.loyalty
                                                    ?.toLowerCase() ==
                                                'silver'
                                            ? GradientColor.silver
                                            : controller.profile.value?.loyalty
                                                        ?.toLowerCase() ==
                                                    'gold'
                                                ? GradientColor.gold
                                                : GradientColor.platinum,
                                        controller.profile.value?.noMember ??
                                            '',
                                        controller.profile.value?.noMember ??
                                            '',
                                        controller.profile.value?.contact ?? '',
                                      );
                                    },
                                    child: Image.network(
                                      '${ApiUrl.baseStorageUrl}/${StorageUrl.qr}/${controller.profile.value?.noMember}.png',
                                      width: 110,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            controller.noMember.value ?? '',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'OCR-A',
                              fontWeight: FontWeight.w600,
                              letterSpacing: Get.width < 390 ? 4 : 5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            if (controller.token.value != null) const SizedBox(height: 10),
            if (controller.token.value != null)
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(EvaIcons.smartphone),
                            const SizedBox(width: 5),
                            controller.profile.value == null
                                ? BaseShimmer(
                                    child: Container(
                                      height: 16,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  )
                                : BaseText(
                                    text: controller.profile.value?.contact ==
                                                null ||
                                            controller.profile.value?.contact ==
                                                ''
                                        ? '-'
                                        : controller.profile.value?.contact ??
                                            '-',
                                    bold: FontWeight.w500,
                                  ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Icon(EvaIcons.calendar),
                            const SizedBox(width: 5),
                            Expanded(
                              child: controller.profile.value == null
                                  ? BaseShimmer(
                                      child: Container(
                                        height: 16,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade300,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                      ),
                                    )
                                  : controller.profile.value?.birthPlace ==
                                              null &&
                                          controller.birthDate.value == null
                                      ? const BaseText(text: '-')
                                      : controller.profile.value?.birthPlace !=
                                                  null &&
                                              controller.birthDate.value == null
                                          ? BaseText(
                                              text:
                                                  '${controller.profile.value?.birthPlace}, -')
                                          : controller.profile.value
                                                          ?.birthPlace ==
                                                      null &&
                                                  controller.birthDate.value !=
                                                      null
                                              ? BaseText(
                                                  text:
                                                      '-, ${controller.birthDate.value}')
                                              : BaseText(
                                                  text:
                                                      '${controller.profile.value?.birthPlace.toString().capitalize}, ${controller.birthDate.value}',
                                                  bold: FontWeight.w500,
                                                ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll(purpleColor),
                      foregroundColor:
                          const MaterialStatePropertyAll(Colors.white),
                      padding: const MaterialStatePropertyAll(EdgeInsets.zero),
                      overlayColor: MaterialStatePropertyAll(
                          softPurpleColor.withOpacity(0.3)),
                    ),
                    padding: EdgeInsets.zero,
                    tooltip: 'Edit Profil',
                    onPressed: () {
                      Get.toNamed('/editProfile');
                    },
                    icon: const Icon(EvaIcons.edit),
                  ),
                ],
              ),
            if (controller.token.value != null)
              PointVoucherBox(
                totalPoint: AppHelpers.thousandFormat(
                    int.parse(controller.profile.value?.loyaltyPoint ?? '0')),
                totalVoucher: AppHelpers.thousandFormat(
                    int.parse(controller.profile.value?.voucherTotal ?? '0')),
              ),
          ],
        ),
      ),
    );
  }
}
