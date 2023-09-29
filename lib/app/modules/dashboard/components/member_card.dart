import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_button.dart';
import 'package:triwarna_rebuild/app/components/base_membercard.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/core/values/gradients.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';

class MemberCard extends StatelessWidget {
  MemberCard({
    Key? key,
    this.gradient,
    this.padding,
    this.color,
    required this.child,
  }) : super(key: key);

  final controller = Get.find<DashboardController>();
  final Gradient? gradient;
  final EdgeInsets? padding;
  final Color? color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.token.value == null
          ? BaseMemberCard(
              color: purpleColor,
              gradient: GradientColor.nomember,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: SvgPicture.asset(
                        'assets/images/logo_grey.svg',
                        width: 150,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BaseText(text: 'Daftar sebagai'),
                                    BaseText(
                                      text: 'Membership GRATIS!',
                                      bold: FontWeight.bold,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                child: BaseButton(
                                  label: 'Daftar Membership',
                                  bgColor: purpleColor,
                                  fgColor: Colors.white,
                                  onPressed: () {
                                    Get.toNamed('/register');
                                  },
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  const BaseText(text: 'Sudah punya akun?'),
                                  const SizedBox(width: 5),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed('/login');
                                    },
                                    child: const BaseText(
                                      text: 'Log In Disini',
                                      color: purpleColor,
                                      bold: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        SvgPicture.asset(
                          'assets/images/member_medal.svg',
                          width: 90,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : BaseMemberCard(
              color: color,
              gradient: gradient,
              padding: padding,
              child: child,
            ),
    );
  }
}
