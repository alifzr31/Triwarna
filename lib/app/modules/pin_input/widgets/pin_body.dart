import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/modules/pin_input/controller.dart';

class PinBody extends StatelessWidget {
  PinBody({super.key});
  final controller = Get.find<PinInputController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (var i = 0; i < 3; i++)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  3,
                  (index) => TextButton(
                    style: const ButtonStyle(
                      shape: MaterialStatePropertyAll(CircleBorder()),
                      padding: MaterialStatePropertyAll(EdgeInsets.all(15)),
                    ),
                    onPressed: () => controller.enterPin(context, 1 + 3 * i + index),
                    child: Text(
                      (1 + 3 * i + index).toString(),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextButton(onPressed: null, child: SizedBox()),
                TextButton(
                  style: const ButtonStyle(
                      shape: MaterialStatePropertyAll(CircleBorder()),
                      padding: MaterialStatePropertyAll(EdgeInsets.all(15))),
                  onPressed: () => controller.enterPin(context, 0),
                  child: Text(
                    0.toString(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                TextButton(
                  style: const ButtonStyle(
                      shape: MaterialStatePropertyAll(CircleBorder()),
                      padding: MaterialStatePropertyAll(EdgeInsets.all(15))),
                  onPressed: controller.deletePin,
                  child: const Icon(
                    Icons.backspace,
                    size: 24,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
