import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_shimmer.dart';
import 'package:triwarna_rebuild/app/components/pointvoucher_box.dart';
import 'package:triwarna_rebuild/app/core/utils/api_url.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/core/values/gradients.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/account/profile_box.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/member_progress.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/show_pictprofile.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';

class HeaderAccount extends StatelessWidget {
  HeaderAccount({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Column(
            children: [
              Container(
                height: 80,
                width: Get.width,
                decoration: BoxDecoration(
                  gradient: controller.profile.value?.loyalty == null
                      ? const LinearGradient(
                          colors: [
                            softPurpleColor,
                            purpleColor,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )
                      : controller.profile.value?.loyalty?.toLowerCase() ==
                              'silver'
                          ? GradientColor.silver
                          : controller.profile.value?.loyalty?.toLowerCase() ==
                                  'gold'
                              ? GradientColor.gold
                              : GradientColor.platinum,
                ),
                child: SvgPicture.asset(
                  'assets/images/bg_account.svg',
                  fit: BoxFit.cover,
                ),
              ),
              ProfileBox(
                name: controller.profile.value?.name ?? '',
                noMember: controller.profile.value?.noMember ?? '',
                totalPoint: controller.profile.value?.loyaltyPoint ?? '0',
                totalVoucher: controller.profile.value?.voucherTotal ?? '0',
                category:
                    controller.profile.value?.loyalty?.toLowerCase() ?? '',
                totalTransaction:
                    controller.profile.value?.spendingTotal ?? '0',
                memberProgress: MemberProgress(
                  category:
                      controller.profile.value?.loyalty?.toLowerCase() ?? '',
                  currentTransaction:
                      int.parse(controller.profile.value?.spendingTotal ?? '0'),
                ),
              ),
            ],
          ),
          Positioned(
            top: 28,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: controller.profile.value == null
                  ? const BaseShimmer(
                      child: CircleAvatar(
                        radius: 35,
                        backgroundColor: softPurpleColor,
                        foregroundColor: purpleColor,
                        child: Icon(
                          Icons.person,
                          size: 35,
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () => showPictProfile(
                        controller.profile.value?.image ?? '',
                      ),
                      child: CircleAvatar(
                        radius: 35,
                        backgroundImage: Image.network(
                          '${ApiUrl.baseStorageUrl}${StorageUrl.profile}/${controller.profile.value?.image}',
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            return loadingProgress == null
                                ? child
                                : Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
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
                        ).image,
                      ),
                    ),
            ),
          ),
          Positioned(
            top: 85,
            left: 66,
            child: controller.profile.value == null
                ? BaseShimmer(
                    child: SvgPicture.asset(
                      'assets/images/silver_medal.svg',
                      width: 20,
                    ),
                  )
                : SvgPicture.asset(
                    controller.profile.value?.loyalty?.toLowerCase() == 'silver'
                        ? 'assets/images/silver_medal.svg'
                        : controller.profile.value?.loyalty?.toLowerCase() ==
                                'gold'
                            ? 'assets/images/gold_medal.svg'
                            : 'assets/images/platinum_medal.svg',
                    width: 20,
                  ),
          ),
          Positioned(
            top: 165,
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: PointVoucherBox(
                totalPoint: controller.profile.value == null
                    ? ''
                    : controller.profile.value?.loyaltyPoint ?? '0',
                totalVoucher: controller.profile.value == null
                    ? ''
                    : controller.profile.value?.voucherTotal ?? '0',
                token: controller.token.value,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
