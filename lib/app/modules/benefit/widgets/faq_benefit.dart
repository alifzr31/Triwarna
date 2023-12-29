import 'package:eva_icons_flutter/eva_icons_flutter.dart';
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 1,
            clipBehavior: Clip.antiAlias,
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.questions.length,
              itemBuilder: (context, index) {
                final question = controller.questions[index];

                return Column(
                  children: [
                    Card(
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      elevation: 0,
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.zero,
                      shape: const RoundedRectangleBorder(),
                      child: InkWell(
                        onTap: () => Get.toNamed(
                          '/answerFaq',
                          arguments: {
                            'question': question,
                            'questionTrigger': index,
                          },
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                child: BaseText(text: question),
                              ),
                              const Icon(EvaIcons.chevronRight),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (index != controller.questions.length - 1)
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 15,
                        ),
                        child: Divider(
                          height: 1,
                          color: Color(0xFFE9E9E9),
                        ),
                      ),
                  ],
                );
              },
            ),
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
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          itemCount: controller.termItems.length,
                          itemBuilder: (context, index) {
                            final termItem = controller.termItems[index];

                            return TermItem(
                              text: termItem,
                            );
                          },
                        ),
                      ),
                      Container(
                        width: Get.width,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: const [
                              TextSpan(
                                text: '*',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.red,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              TextSpan(
                                text: 'Disclaimer, ',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'pihak Triwarna berhak mengubah Syarat dan Ketentuan Poin dan Member sewaktu - waktu tanpa ada pemberitahuan terlebih dahulu kepada pengguna.',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.red,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
