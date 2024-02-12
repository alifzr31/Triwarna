import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/forgot_pin/reset_pin/controller.dart';

class ResetPinBody extends StatelessWidget {
  ResetPinBody({super.key});
  final controller = Get.find<ResetPinController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController.value,
        onPageChanged: (index) => controller.currentPage.value = index,
        itemCount: controller.title.length,
        itemBuilder: (context, index) {
          return Obx(
            () => Column(
              children: [
                if (controller.currentPage.value == 1)
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: CupertinoButton(
                        minSize: 25,
                        padding: EdgeInsets.zero,
                        onPressed: controller.prevPage,
                        child: const BaseText(
                          text: 'Ulangi',
                          size: 12,
                          color: purpleColor,
                          bold: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                Container(
                  width: Get.width,
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BaseText(
                        text: controller.title[index],
                        size: 18,
                        bold: FontWeight.w600,
                      ),
                      const SizedBox(height: 20),
                      if (controller.currentPage.value == 1)
                        Visibility(
                          visible: controller.showAlert.value,
                          child: const BaseText(
                            text: 'PIN Tidak Cocok',
                            size: 16,
                            color: Colors.red,
                            bold: FontWeight.w600,
                          ),
                        ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 1; i <= 6; i++)
                            Container(
                              width: 20,
                              height: 20,
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: controller.currentPage.value == 0
                                    ? controller.newPinDigits[i - 1].isEmpty
                                        ? softPurpleColor
                                        : purpleColor
                                    : controller.confirmPinDigits[i - 1].isEmpty
                                        ? softPurpleColor
                                        : controller.showAlert.value
                                            ? Colors.red
                                            : purpleColor,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                    child: GridView.count(
                      crossAxisCount: 3,
                      childAspectRatio: Get.width < 390 ? 1.3 : 1,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(15),
                      physics: const ClampingScrollPhysics(),
                      children: [
                        for (int i = 1; i <= 9; i++)
                          InkResponse(
                            onTap: () => controller.currentPage.value == 0
                                ? controller.updateNewPinDigit(i.toString())
                                : controller
                                    .updateConfirmPinDigit(i.toString()),
                            child: Center(
                              child: BaseText(
                                text: i.toString(),
                                size: 32,
                                color: purpleColor,
                              ),
                            ),
                          ),
                        const SizedBox.shrink(),
                        InkResponse(
                          onTap: () => controller.currentPage.value == 0
                              ? controller.updateNewPinDigit('0')
                              : controller.updateConfirmPinDigit('0'),
                          child: const Center(
                            child: BaseText(
                              text: '0',
                              size: 32,
                              color: purpleColor,
                            ),
                          ),
                        ),
                        InkResponse(
                          onTap: () => controller.deletePinDigit(),
                          child: const Icon(
                            Icons.backspace,
                            color: purpleColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
