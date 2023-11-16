import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/modules/onboard/controller.dart';

class PageOnBoard extends StatelessWidget {
  PageOnBoard({super.key});
  final controller = Get.put(OnBoardController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: PageView.builder(
          controller: controller.pageController.value,
          // physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) => controller.currentPage.value = index,
          itemCount: controller.title.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    SizedBox(
                      height: 215,
                      width: Get.width,
                      child: SvgPicture.asset(
                        'assets/images/${controller.images[index]}',
                      ),
                    ),
                    const SizedBox(height: 30),
                    Expanded(
                      child: Column(
                        children: [
                          BaseText(
                            text: controller.title[index],
                            color: Colors.white,
                            textAlign: TextAlign.center,
                            size: 18,
                            bold: FontWeight.w600,
                          ),
                          const SizedBox(height: 10),
                          BaseText(
                            text: controller.desc[index],
                            color: Colors.white,
                            textAlign: TextAlign.center,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
