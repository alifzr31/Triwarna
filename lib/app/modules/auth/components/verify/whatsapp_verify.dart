import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_button.dart';
import 'package:triwarna_rebuild/app/components/base_formgrouppin.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/auth/widgets/verify/controller.dart';

class WhatsAppVerify extends StatelessWidget {
  WhatsAppVerify({super.key});
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
                    text: 'Verifikasi OTP',
                    size: 20,
                    color: Colors.white,
                    bold: FontWeight.w600,
                  ),
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: [
                        const TextSpan(
                          text: 'Kode OTP sudah dikirim ke whatsapp ',
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                        TextSpan(
                          text: controller.phoneNumber.value ?? '',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Form(
                    key: controller.formKeyOTP.value,
                    child: BaseFormGroupForgotPin(
                      label: 'Kode OTP',
                      controller: controller.otpController.value,
                      obscureText: false,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Kode OTP tidak boleh kosong';
                        }

                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: Get.width,
                    child: BaseButton(
                      bgColor: softPurpleColor,
                      fgColor: purpleColor,
                      label: 'Submit',
                      onPressed: () {
                        if (controller.formKeyOTP.value.currentState
                                ?.validate() ??
                            false) {}
                      },
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const BaseText(
                        text: 'Tidak menerima kode? ',
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
