import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/benefit/components/term_item.dart';
import 'package:triwarna_rebuild/app/modules/benefit/controller.dart';

class FaqBenefit extends StatelessWidget {
  FaqBenefit({super.key});
  final controller = Get.find<BenefitController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              Card(
                color: Colors.white,
                surfaceTintColor: Colors.white,
                elevation: 3,
                margin: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: BaseText(
                    text: 'PERTANYAAN YANG SERING DITANYAKAN',
                    size: 16,
                    color: purpleColor,
                    bold: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    clipBehavior: Clip.antiAlias,
                    elevation: 1,
                    child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return ExpansionTileCard(
                          baseColor: softYellowColor,
                          expandedColor: softYellowColor,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          borderRadius: BorderRadius.circular(0),
                          finalPadding: EdgeInsets.zero,
                          title: const BaseText(
                              text: 'Lorem ipsum dolor sit amet, conse?'),
                          children: [
                            Container(
                              width: Get.width,
                              color: Colors.white,
                              margin: const EdgeInsets.only(bottom: 10),
                              padding: const EdgeInsets.all(15),
                              child: const BaseText(
                                text:
                                    'Lorem ipsum dolor sit amet, conse ? Lorem ipsum dolor sit amet, conse ?Lorem ipsum dolor sit amet, conse ?',
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: Get.width,
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: softPurpleColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                const BaseText(
                  text: 'SYARAT & KETENTUAN',
                  size: 16,
                  color: purpleColor,
                  bold: FontWeight.bold,
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const TermItem(
                        text:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
