import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/components/level_label.dart';

class CardLevel extends StatelessWidget {
  const CardLevel({
    Key? key,
    required this.loyaltyLevel,
    required this.descChildren,
    this.barColor,
    this.barGradient,
    this.labelColor,
    this.labelGradient,
    this.showLabel = false,
  }) : super(key: key);

  final String loyaltyLevel;
  final List<InlineSpan> descChildren;
  final Color? barColor;
  final Gradient? barGradient;
  final Color? labelColor;
  final Gradient? labelGradient;
  final bool showLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 250,
      margin: const EdgeInsets.only(right: 15, bottom: 5),
      child: Material(
        color: Colors.white,
        elevation: 3,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: BaseText(
                      text: loyaltyLevel,
                      bold: FontWeight.w600,
                    ),
                  ),
                  Visibility(
                    visible: showLabel,
                    child: LevelLabel(
                      labelColor: labelColor,
                      labelGradient: labelGradient,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 8,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: barColor,
                        gradient: barGradient,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: descChildren,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
