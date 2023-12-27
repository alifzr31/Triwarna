import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_button.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/auth/widgets/verify/controller.dart';

// class VerifyBody extends StatelessWidget {
//   VerifyBody({super.key});
//   final controller = Get.find<VerifyController>();

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => PageView(
//         controller: controller.pageController.value,
//         physics: const NeverScrollableScrollPhysics(),
//         children: [
//           ChooseVerify(),
//           if (controller.chooseVerify.value != null)
//             controller.chooseVerify.value == 'whatsapp'
//                 ? WhatsAppVerify()
//                 : EmailVerify(),
//         ],
//       ),
//     );
//   }
// }

class VerifyBody extends StatelessWidget {
  VerifyBody({super.key});
  final controller = Get.find<VerifyController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const BaseText(
              text: 'Verifikasi Akun',
              size: 20,
              color: Colors.white,
              bold: FontWeight.w600,
            ),
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: controller.hasSent.value
                        ? 'Tautan aktivasi akun, sudah dikirim ke email\n'
                        : 'Tautan aktivasi akun, akan dikirim ke email\n',
                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                  TextSpan(
                    text: controller.email.value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: Get.width,
              child: controller.hasSent.value
                  ? BaseButtonIcon(
                      bgColor: softPurpleColor,
                      fgColor: purpleColor,
                      icon: EvaIcons.email,
                      label: 'Buka Email',
                      onPressed: controller.openMailApp,
                    )
                  : BaseButton(
                      bgColor: softPurpleColor,
                      fgColor: purpleColor,
                      label: 'Kirim Tautan Aktivasi',
                      onPressed: controller.verifyEmail,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
