import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:triwarna_rebuild/app/components/base_button.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/core/values/gradients.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';
import 'package:triwarna_rebuild/app/modules/point/components/my_point/card_point.dart';
import 'package:triwarna_rebuild/app/modules/point/controller.dart';

class HeaderPoint extends StatelessWidget {
  HeaderPoint({super.key});
  final controller = Get.find<PointController>();
  final userController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Center(
        child: Obx(
          () {
            final spend =
                int.parse(userController.profile.value?.spendingTotal ?? '');
            final totalSpending = NumberFormat.currency(
              locale: 'id_ID',
              symbol: 'Rp ',
            ).format(spend);

            return Column(
              children: [
                SvgPicture.asset('assets/images/point_icon.svg'),
                controller.pointLoading.value
                    ? SizedBox(
                        height: 46,
                        child: CupertinoActivityIndicator(
                          color: yellowColor,
                        ),
                      )
                    : BaseText(
                        text: controller.lastPoint.value ?? '',
                        color: yellowColor,
                        size: 32,
                        bold: FontWeight.w500,
                      ),
                BaseButton(
                  bgColor: purpleColor,
                  fgColor: Colors.white,
                  label: 'Tukar Poin',
                  onPressed: () {
                    Get.toNamed('/redeemPoint');
                  },
                ),
                CardPoint(
                  loyaltyTier: userController.profile.value?.loyalty
                          .toString()
                          .capitalize ??
                      '',
                  totalSpending: totalSpending,
                  proggressWidth: spend * (Get.width / 100000000),
                  gradient: userController.profile.value?.loyalty
                              .toString()
                              .toLowerCase() ==
                          'silver'
                      ? GradientColor.silver
                      : userController.profile.value?.loyalty
                                  .toString()
                                  .toLowerCase() ==
                              'gold'
                          ? GradientColor.gold
                          : GradientColor.platinum,
                  lastTransaction: controller.pointLoading.value
                      ? Shimmer.fromColors(
                          baseColor: purpleColor,
                          highlightColor: Colors.grey.shade600,
                          child: Container(
                            height: 14,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        )
                      : BaseText(
                          text: controller.lastTransaction.value ?? '',
                          size: 12,
                          bold: FontWeight.w500,
                          color: Colors.white,
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
