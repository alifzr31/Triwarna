import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';
import 'package:triwarna_rebuild/app/modules/pin_input/controller.dart';

class PinNumber extends StatelessWidget {
  PinNumber({super.key});
  final controller = Get.find<PinInputController>();
  final userController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            children: [
              const Icon(
                EvaIcons.lock,
                size: 85,
                color: purpleColor,
              ),
              SizedBox(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 1; i <= 6; i++)
                      Container(
                        width: 20,
                        height: 20,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: controller.pinDigits[i - 1].isEmpty
                              ? Colors.grey
                              : purpleColor,
                        ),
                      ),
                  ],
                ),
              ),
              if (controller.visible.value) const SizedBox(height: 5),
              Visibility(
                visible: controller.visible.value,
                child: const BaseText(
                  text: 'PIN Salah',
                  size: 16,
                  bold: FontWeight.w600,
                  color: Colors.red,
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: Get.width < 390 ? 1.3 : 1,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    for (int i = 1; i <= 9; i++)
                      InkResponse(
                        onTap: () =>
                            controller.updatePinDigit(context, i.toString()),
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
                      onTap: () => controller.updatePinDigit(context, '0'),
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
            ],
          ),
        ),
      ),
    );
  }
}
