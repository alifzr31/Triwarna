import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_shimmer.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/components/pointvoucher_box.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/core/values/gradients.dart';
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
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BaseText(
                                        text: controller
                                                .profile.value?.noMember ??
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
                                Container(
                                  height: 40,
                                  width: 155,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: softPurpleColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: BaseText(
                                      text:
                                          '${controller.profile.value?.loyalty} MEMBER',
                                      bold: FontWeight.w600,
                                      color: purpleColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 15),
                          SvgPicture.asset(
                            'assets/images/member_medal.svg',
                            width: 80,
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
                                text: controller.profile.value?.name
                                        .toString()
                                        .capitalize ??
                                    '',
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
                                text: controller.profile.value?.contact ?? '',
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
