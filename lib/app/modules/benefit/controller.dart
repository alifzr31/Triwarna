import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/app_helpers.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/core/values/gradients.dart';
import 'package:triwarna_rebuild/app/modules/benefit/components/card_level.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';

class BenefitController extends GetxController {
  final token = Rx<String?>(null);
  final loyaltyLevel = Rx<String?>(null);
  final total = 0.obs;
  final spendingTotal = Rx<String?>(null);
  final currentIndex = 0.obs;

  @override
  void onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final userController = Get.find<DashboardController>();
    token.value = sharedPreferences.getString('token');

    if (token.value != null) {
      if (userController.profile.value != null) {
        loyaltyLevel.value = userController.profile.value?.loyalty;
        total.value =
            int.parse(userController.profile.value?.spendingTotal ?? '0');
        spendingTotal.value = AppHelpers.rupiahFormat(total.value);
      }
    }
    super.onInit();
  }

  final level = [
    'Silver',
    'Gold',
    'Platinum',
  ];

  final descChildren = const [
    [
      TextSpan(text: 'Transaksi minimal Rp '),
      TextSpan(
        text: '0',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
    [
      TextSpan(text: 'Transaksi minimal Rp '),
      TextSpan(
        text: '10.000.000,-',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
    [
      TextSpan(text: 'Transaksi minimal Rp '),
      TextSpan(
        text: '100.000.000,-',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  ];

  final barColor = [
    GradientColor.silver,
    GradientColor.gold,
    GradientColor.platinum,
  ];

  final cardLevel = [
    const CardLevel(
      loyaltyLevel: 'Silver',
      labelColor: silverSolidLabel,
      descChildren: [
        TextSpan(text: 'Transaksi minimal Rp '),
        TextSpan(
          text: '0',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
      barGradient: GradientColor.silver,
    ),
    const CardLevel(
      loyaltyLevel: 'Gold',
      labelColor: goldSolidLabel,
      descChildren: [
        TextSpan(text: 'Transaksi minimal Rp '),
        TextSpan(
          text: '10.000.000,-',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
      barGradient: GradientColor.gold,
    ),
    CardLevel(
      loyaltyLevel: 'Platinum',
      labelGradient: GradientColor.platinumLabel,
      descChildren: const [
        TextSpan(text: 'Transaksi minimal Rp '),
        TextSpan(
          text: '100.000.000,-',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
      barGradient: GradientColor.platinum,
    ),
  ].obs;

  final tabBar = [
    Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/silver_medal.svg',
            width: 20,
          ),
          const SizedBox(width: 5),
          const BaseText(text: 'Silver', bold: FontWeight.w500),
        ],
      ),
    ),
    Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/gold_medal.svg',
            width: 20,
          ),
          const SizedBox(width: 5),
          const BaseText(text: 'Gold', bold: FontWeight.w500),
        ],
      ),
    ),
    Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/platinum_medal.svg',
            width: 20,
          ),
          const SizedBox(width: 5),
          const BaseText(text: 'Platinum', bold: FontWeight.w500),
        ],
      ),
    ),
  ].obs;
}
