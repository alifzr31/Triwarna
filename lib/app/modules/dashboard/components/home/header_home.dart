import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_shimmer.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/components/pointvoucher_box.dart';
import 'package:triwarna_rebuild/app/core/utils/api_url.dart';
import 'package:triwarna_rebuild/app/core/values/app_helpers.dart';
import 'package:triwarna_rebuild/app/core/values/gradients.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/home/menu_header.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/home/show_qr.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/member_card.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';

class HeaderHome extends StatelessWidget {
  HeaderHome({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(15),
      color: Colors.white,
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            controller.token.value == null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BaseText(
                        text: 'Selamat Datang di Triwarna!',
                        size: 16,
                        bold: FontWeight.w600,
                      ),
                      BaseText(
                        text:
                            'Yuk, daftar membership untuk mendapatkan hadiah menarik  ',
                        size: 12,
                        color: Colors.grey.shade600,
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const BaseText(
                            text: 'Halo, ',
                            size: 16,
                            bold: FontWeight.w500,
                          ),
                          controller.profile.value == null
                              ? BaseShimmer(
                                  child: Container(
                                    height: 16,
                                    width: 200,
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
                                  size: 16,
                                  bold: FontWeight.w600,
                                ),
                        ],
                      ),
                      BaseText(
                        text:
                            'Kumpulkan poin dan tukarkan dengan hadiah-hadiah menarik',
                        size: 12,
                        color: Colors.grey.shade600,
                      ),
                    ],
                  ),
            const SizedBox(height: 20),
            controller.profile.value == null &&
                    controller.noMember.value == null &&
                    controller.token.value != null
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
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.noMember.value ?? '',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: Get.width < 390 ? 2 : 3,
                                      ),
                                    ),
                                    BaseText(
                                      text:
                                          controller.profile.value?.email ?? '',
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
                                      controller.profile.value?.noMember ?? '',
                                      controller.profile.value?.noMember ?? '',
                                      controller.profile.value?.contact ?? '',
                                    );
                                  },
                                  child: Image.network(
                                      '${ApiUrl.baseStorageUrl}/${StorageUrl.qr}/${controller.profile.value?.noMember}.png'),
                                ),
                            ],
                          ),
                        ),
                        PointVoucherBox(
                          totalPoint: AppHelpers.thousandFormat(int.parse(
                              controller.profile.value?.loyaltyPoint ?? '0')),
                          totalVoucher: AppHelpers.thousandFormat(int.parse(
                              controller.profile.value?.voucherTotal ?? '0')),
                        ),
                      ],
                    ),
                  ),
            const SizedBox(height: 5),
            const MenuHeader(),
          ],
        ),
      ),
    );
  }
}
