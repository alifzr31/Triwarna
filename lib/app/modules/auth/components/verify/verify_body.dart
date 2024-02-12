import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/modules/auth/components/verify/choose_verify.dart';
import 'package:triwarna_rebuild/app/modules/auth/components/verify/email_verify.dart';
import 'package:triwarna_rebuild/app/modules/auth/components/verify/whatsapp_verify.dart';
import 'package:triwarna_rebuild/app/modules/auth/widgets/verify/controller.dart';

class VerifyBody extends StatelessWidget {
  VerifyBody({super.key});
  final controller = Get.find<VerifyController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PageView(
        controller: controller.pageController.value,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ChooseVerify(),
          if (controller.chooseVerify.value != null)
            controller.chooseVerify.value == 'whatsapp'
                ? WhatsAppVerify()
                : EmailVerify(),
        ],
      ),
    );
  }
}
