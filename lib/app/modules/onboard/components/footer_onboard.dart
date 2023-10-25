import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/onboard/controller.dart';

class FooterOnboard extends StatelessWidget {
  FooterOnboard({super.key});
  final controller = Get.put(onBoardController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              controller.currentPage.value != (controller.title.length - 1)
                  ? InkResponse(
                      splashColor: softPurpleColor,
                      onTap: () {
                        controller.skip();
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: BaseText(text: 'Lewati'),
                      ),
                    )
                  : const BaseText(
                      text: 'Lewati',
                      color: baseBgScaffold,
                    ),
              Expanded(
                child: Row(
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
                            ? purpleColor
                            : softPurpleColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                style: ButtonStyle(
                  overlayColor: MaterialStatePropertyAll(
                      softPurpleColor.withOpacity(0.3)),
                  backgroundColor: const MaterialStatePropertyAll(purpleColor),
                  shape: MaterialStatePropertyAll(
                    ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                onPressed: () {
                  if (controller.currentPage.value ==
                      (controller.title.length - 1)) {
                    controller.getStarted();
                  } else {
                    controller.nextPage();
                  }
                },
                icon: const Icon(
                  EvaIcons.arrowIosForward,
                  color: Colors.white,
                ),
              ),
            ],
          )),
    );
  }
}
