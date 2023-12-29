import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/modules/answer_faq/components/answer_item.dart';
import 'package:triwarna_rebuild/app/modules/answer_faq/controller.dart';

class AnswerFaqBody extends StatelessWidget {
  AnswerFaqBody({super.key});
  final controller = Get.find<AnswerFaqController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BaseText(
              text: controller.chooseQuestion.value ?? '',
              size: 18,
              bold: FontWeight.w600,
            ),
            const SizedBox(height: 15),
            Expanded(
              child: controller.questionTrigger.value == 0
                  ? ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: controller.failLogin.length,
                      itemBuilder: (context, index) {
                        final answer = controller.failLogin[index];

                        return AnswerItem(
                          number: (index + 1).toString(),
                          answer: answer,
                        );
                      },
                    )
                  : controller.questionTrigger.value == 1
                      ? RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: [
                              const TextSpan(
                                  text:
                                      'Point member bisa ditukar dengan berbagai hadiah menarik '),
                              TextSpan(
                                text: 'klik disini ',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.toNamed('/point');
                                  },
                              ),
                              const TextSpan(
                                  text: ' untuk melihat detail hadiah.'),
                            ],
                          ),
                        )
                      : controller.questionTrigger.value == 2
                          ? const BaseText(
                              text:
                                  'Tentu saja bisa anda dapat menukar poin diseluruh cabang triwarna.')
                          : ListView.builder(
                              physics: const ClampingScrollPhysics(),
                              itemCount: controller.failRedeem.length,
                              itemBuilder: (context, index) {
                                final answer = controller.failRedeem[index];

                                return AnswerItem(
                                  number: (index + 1).toString(),
                                  answer: answer,
                                );
                              },
                            ),
            ),
          ],
        ),
      ),
    );
  }
}
