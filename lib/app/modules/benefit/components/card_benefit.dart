import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';

class CardBenefit extends StatelessWidget {
  const CardBenefit({
    super.key,
    required this.loyaltyLevel,
    this.desc,
    this.color,
    this.gradient,
    this.token,
    this.progressColor,
    this.progressGradient,
  });

  final String loyaltyLevel;
  final Widget? desc;
  final Color? color;
  final Gradient? gradient;
  final String? token;
  final Color? progressColor;
  final Gradient? progressGradient;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Material(
        elevation: 3,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: color,
            gradient: gradient,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              BaseText(
                text: loyaltyLevel,
                size: 18,
                bold: FontWeight.w600,
              ),
              const SizedBox(height: 15),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      token == null
                          ? const BaseText(
                              text: 'Segera daftarkan diri anda menjadi member',
                              textAlign: TextAlign.center,
                            )
                          : Align(
                              alignment: Alignment.centerLeft,
                              child: desc,
                            ),
                      const SizedBox(height: 5),
                      token == null
                          ? Expanded(
                              child: Center(
                                child: Material(
                                  elevation: 2,
                                  borderRadius: BorderRadius.circular(5),
                                  clipBehavior: Clip.antiAlias,
                                  child: Container(
                                    height: 15,
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                      color: progressColor,
                                      gradient: progressGradient,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Material(
                              elevation: 2,
                              borderRadius: BorderRadius.circular(5),
                              clipBehavior: Clip.antiAlias,
                              child: Container(
                                height: 15,
                                width: Get.width,
                                color: progressColor,
                              ),
                            ),
                      if (token != null) const SizedBox(height: 5),
                      if (token != null)
                        BaseText(
                          text:
                              'Pertahankan level membermu sampai tahun berikutnya!',
                          size: 12,
                          color: Colors.grey.shade600,
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
