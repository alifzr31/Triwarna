import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:triwarna_rebuild/app/components/base_button.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/onboard/controller.dart';

class FooterOnboard extends StatelessWidget {
  FooterOnboard({super.key});
  final controller = Get.put(OnBoardController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                controller.title.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 8,
                  width: 8,
                  margin: const EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                    color: controller.currentPage.value == index
                        ? yellowColor
                        : softPurpleColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: Get.width,
              child: BaseButton(
                bgColor: softPurpleColor,
                fgColor: purpleColor,
                label: controller.currentPage.value ==
                        (controller.title.length - 1)
                    ? 'Mulai Sekarang'
                    : 'Lanjutkan',
                onPressed: () {
                  if (controller.currentPage.value ==
                      (controller.title.length - 1)) {
                    controller.getStarted();
                  } else {
                    controller.nextPage();
                  }
                },
              ),
            ),
            const SizedBox(height: 5),
            GestureDetector(
              onTap: () async {
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.setBool('opened', true);
                if (controller.currentPage.value ==
                    (controller.title.length - 1)) {
                  Get.offAllNamed('/login');
                } else {
                  controller.skip();
                }
              },
              child: BaseText(
                text: controller.currentPage.value ==
                        (controller.title.length - 1)
                    ? 'Log In'
                    : 'Lewati',
                color: softPurpleColor,
                bold: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
