import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_shimmer.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/components/pointvoucher_box.dart';
import 'package:triwarna_rebuild/app/core/utils/api_url.dart';
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
            controller.profile.value == null && controller.token.value != null
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
                                            CircleAvatar(
                                              radius: 35,
                                              backgroundImage: Image.network(
                                                      '${ApiUrl.baseStorageUrl}${StorageUrl.profile}/${controller.profile.value?.image}')
                                                  .image,
                                            ),
                                            const SizedBox(width: 5),
                                            SvgPicture.asset(
                                              'assets/images/gold_medal.svg',
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                text: controller.profile.value?.contact ?? '',
                                bold: FontWeight.w600,
                              ),
                        if (controller.profile.value == null)
                          const SizedBox(height: 3),
                        controller.profile.value == null
                            ? BaseShimmer(
                                child: Container(
                                  height: 16,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              )
                            : BaseText(
                                text: '${controller.profile.value?.birthPlace}, ${controller.birthDate.value}',
                                color: Colors.grey.shade600,
                              ),
                      ],
                    ),
                  ),
                  IconButton(
                    style: const ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll(purpleColor),
                    ),
                    tooltip: 'Edit Profil',
                    onPressed: () {
                      Get.toNamed('/editProfile');
                    },
                    icon: const Icon(Icons.edit),
                  ),
                ],
              ),
            if (controller.token.value != null)
              PointVoucherBox(
                totalPoint: controller.profile.value?.loyaltyPoint ?? '',
                totalVoucher: controller.profile.value?.voucherTotal ?? '',
              ),
          ],
        ),
      ),
    );
  }
}
