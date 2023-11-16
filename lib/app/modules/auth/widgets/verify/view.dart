import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:triwarna_rebuild/app/components/base_appbar.dart';
import 'package:triwarna_rebuild/app/components/base_button.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/auth/controller.dart';

class VerifyPage extends StatelessWidget {
  const VerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        bgColor: purpleColor,
        title: '',
        preferredSize: Size.zero,
      ),
      backgroundColor: purpleColor,
      body: Stack(
        children: [
          Positioned(
            top: 70,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              'assets/images/logo_tri_white.svg',
              width: 230,
            ),
          ),
          const VerifyBody(),
        ],
      ),
    );
  }
}

class VerifyBody extends StatefulWidget {
  const VerifyBody({super.key});

  @override
  State<VerifyBody> createState() => _VerifyBodyState();
}

class _VerifyBodyState extends State<VerifyBody> {
  final controller = Get.find<AuthController>();

  @override
  void initState() {
    controller.email.value = Get.arguments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const BaseText(
                text: 'Akun anda sudah berhasil dibuat dengan email',
                textAlign: TextAlign.center,
                size: 16,
                color: Colors.white,
              ),
              BaseText(
                text: controller.email.value ?? '',
                textAlign: TextAlign.center,
                color: Colors.white,
                size: 16,
                bold: FontWeight.w600,
              ),
              const SizedBox(height: 10),
              controller.verifyLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(color: yellowColor),
                    )
                  : SizedBox(
                      width: Get.width,
                      child: BaseButtonIcon(
                        bgColor: softPurpleColor,
                        fgColor: purpleColor,
                        label: controller.hasSent.value
                            ? 'Buka Email'
                            : 'Verifikasi Akun',
                        icon: EvaIcons.email,
                        onPressed: () async {
                          if (controller.hasSent.value) {
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
                          } else {
                            controller.verify();
                          }
                        },
                      ),
                    ),
              if (controller.hasSent.isTrue)
                const Column(
                  children: [
                    SizedBox(height: 10),
                    BaseText(
                      text:
                          'Link verifikasi sudah dikirim ke email anda. Silahkan buka email anda lalu lakukan aktivasi akun. Terima kasih',
                      color: Colors.green,
                      bold: FontWeight.w500,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
