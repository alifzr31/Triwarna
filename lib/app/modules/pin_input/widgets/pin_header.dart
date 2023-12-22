import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/pin_input/controller.dart';

class PinHeader extends StatelessWidget {
  PinHeader({super.key});
  final controller = Get.find<PinInputController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (controller.hasError.value)
                Text(
                  'PIN Salah',
                  style: TextStyle(
                    color: Colors.red.shade800,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  6,
                  (index) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index < controller.enteredPin.value.length
                            ? purpleColor
                            : softPurpleColor,
                      ),
                    );
                  },
                ),
              ),
              InkWell(
                onTap: () => Get.offAndToNamed('/sendOtp'),
                child: const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text('Lupa PIN?'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
