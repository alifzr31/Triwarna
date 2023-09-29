import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_appbar.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/benefit/widgets/gold_member.dart';
import 'package:triwarna_rebuild/app/modules/benefit/widgets/platinum_member.dart';
import 'package:triwarna_rebuild/app/modules/benefit/widgets/silver_member.dart';

class BenefitPage extends StatelessWidget {
  const BenefitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: BaseAppBar(
          title: 'Benefit Member',
          preferredSize: const Size.fromHeight(
            kToolbarHeight + (kToolbarHeight / 1.5),
          ),
          bgColor: softPurpleColor,
          fgColor: purpleColor,
          bottom: TabBar(
            labelPadding: const EdgeInsets.all(10),
            labelStyle: const TextStyle(fontSize: 14),
            tabs: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/silver_medal.svg', width: 20),
                  const SizedBox(width: 5),
                  const BaseText(
                    text: 'Silver',
                    color: purpleColor,
                    bold: FontWeight.w600,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/gold_medal.svg', width: 20),
                  const SizedBox(width: 5),
                  const BaseText(
                    text: 'Gold',
                    color: purpleColor,
                    bold: FontWeight.w600,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/platinum_medal.svg', width: 20),
                  const SizedBox(width: 5),
                  const BaseText(
                    text: 'Platinum',
                    color: purpleColor,
                    bold: FontWeight.w600,
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Container(
          height: Get.height,
          width: Get.width,
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              SilverMember(),
              GoldMember(),
              PlatinumMember(),
            ],
          ),
        ),
      ),
    );
  }
}
