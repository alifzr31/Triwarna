import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:triwarna_rebuild/app/components/base_button.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/auth/widgets/verify/controller.dart';

class EmailVerify extends StatelessWidget {
  EmailVerify({super.key});
  final controller = Get.find<VerifyController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  controller.pageController.value.animateToPage(
                    0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOutCubic,
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(5),
                  child: BaseText(
                    text: 'Kembali',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
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
                        const TextSpan(
                          text:
                              'Link tautan verifikasi akun sudah dikirim ke email ',
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                        TextSpan(
                          text: controller.email.value ?? '',
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
                    child: BaseButtonIcon(
                      icon: EvaIcons.email,
                      label: 'Buka Email',
                      onPressed: () async {
                        final result = await OpenMailApp.openMailApp();

                        if (!result.didOpen && !result.canOpen) {
                          Get.dialog(
                            const AlertDialog(
                              title: Text('No Apps'),
                            ),
                          );
                        } else if (!result.didOpen && result.canOpen) {
                          Get.dialog(
                            MailAppPickerDialog(mailApps: result.options),
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const BaseText(
                        text: 'Tidak menerima email? ',
                        color: Colors.white70,
                      ),
                      GestureDetector(
                        onTap: () {},
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
          ],
        ),
      ),
    );
  }
}
