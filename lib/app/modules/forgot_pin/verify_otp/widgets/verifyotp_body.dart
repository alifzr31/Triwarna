import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_button.dart';
import 'package:triwarna_rebuild/app/components/base_formgrouppin.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/forgot_pin/verify_otp/controller.dart';

class VerifyOtpBody extends StatelessWidget {
  VerifyOtpBody({super.key});
  final controller = Get.find<VerifyOtpController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BaseText(
                    text: 'Verifikasi OTP',
                    size: 20,
                    color: Colors.white,
                    bold: FontWeight.w600,
                  ),
                  BaseText(
                    text: controller.type.value == 'wa'
                        ? 'Masukkan kode OTP yang sudah kami kirimkan ke whatsapp anda'
                        : 'Masukkan kode OTP yang sudah kami kirimkan ke email anda',
                    size: 12,
                    color: Colors.white70,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            BaseText(
              text: controller.type.value == 'wa'
                  ? 'Kode OTP sudah dikirim ke whatsapp dengan no. telepon\n${controller.noTelp.value}'
                  : 'Kode OTP sudah dikirim ke email\n${controller.email.value}',
              color: Colors.white,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Form(
              key: controller.formKey.value,
              child: Column(
                children: [
                  BaseFormGroupForgotPin(
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
                  const SizedBox(height: 40),
                  SizedBox(
                    width: Get.width,
                    child: BaseButton(
                      bgColor: softPurpleColor,
                      fgColor: purpleColor,
                      label: 'Submit',
                      onPressed: () {
                        if (controller.formKey.value.currentState!.validate()) {
                          controller.verifyOtp();
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 5),
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
                              text: 'Tidak menerima kode? ',
                              color: Colors.white,
                            ),
                            GestureDetector(
                              onTap: controller.resendOtp,
                              child: const BaseText(
                                text: 'Kirim Ulang',
                                color: yellowColor,
                                bold: FontWeight.w500,
                              ),
                            )
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
