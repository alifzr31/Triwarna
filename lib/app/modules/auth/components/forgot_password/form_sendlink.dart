import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_button.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/auth/widgets/forgot_password/send_link/controller.dart';

class FormSendLink extends StatelessWidget {
  FormSendLink({super.key});
  final controller = Get.find<SendLinkController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BaseText(
              text: 'Cek Email Anda',
              size: 20,
              bold: FontWeight.w600,
              color: Colors.white,
            ),
            Container(
              height: 50,
              width: Get.width,
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.red.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info,
                    size: 30,
                    color: Colors.red.shade800,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: BaseText(
                      text: 'Link reset password hanya berlaku selama 1 jam',
                      color: Colors.red.shade800,
                      bold: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: [
                    controller.sent.value
                        ? const TextSpan(
                            text:
                                'Link reset password sudah dikirim ke email\n',
                            style: TextStyle(color: Colors.white70),
                          )
                        : const TextSpan(
                            text: 'Link reset password akan dikirim ke email\n',
                            style: TextStyle(color: Colors.white70),
                          ),
                    TextSpan(
                      text: controller.maskedEmail.value,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (controller.sent.value)
                      const TextSpan(
                        text: '\nSilahkan cek email anda',
                        style: TextStyle(color: Colors.white70),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: Get.width,
              child: BaseButton(
                bgColor: softPurpleColor,
                fgColor: purpleColor,
                label: controller.sent.value
                    ? 'Buka Email'
                    : 'Kirim Link Reset Password',
                onPressed: controller.sent.value
                    ? controller.openMailApp
                    : controller.sendLink,
              ),
            ),
            if (controller.sent.value) const SizedBox(height: 5),
            if (controller.sent.value)
              controller.tunggu.value
                  ? const Text(
                      'Maaf anda sudah melakukan 3 kali request. Silahkan tunggu beberapa saat untuk melakukan request lagi.\nTerima kasih',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const BaseText(
                          text: 'Tidak menerima email? ',
                          color: Colors.white70,
                        ),
                        GestureDetector(
                          onTap: controller.resendLink,
                          child: const BaseText(
                            text: 'Kirim Ulang',
                            color: yellowColor,
                            bold: FontWeight.w500,
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
