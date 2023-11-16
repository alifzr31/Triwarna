import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_button.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/forgot_pin/components/header_otp.dart';
import 'package:triwarna_rebuild/app/modules/forgot_pin/send_otp/controller.dart';

class SendOtpBody extends StatelessWidget {
  SendOtpBody({super.key});
  final controller = Get.find<SendOtpController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderOtp(
              title: 'Lupa PIN',
              subtitle:
                  'Silahkan tekan tombol kirim kode untuk mendapatkan kode otp',
              email: controller.email.value ?? '',
              showAlert: false,
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: Get.width,
              child: BaseButton(
                bgColor: softPurpleColor,
                fgColor: purpleColor,
                label: 'Kirim Kode',
                onPressed: controller.sendOtp,
              ),
            )
          ],
        ),
      ),
    );
  }
}
