import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';

class HeaderOtp extends StatelessWidget {
  const HeaderOtp({
    super.key,
    required this.title,
    required this.subtitle,
    required this.email,
    this.showAlert = false,
  });

  final String title;
  final String subtitle;
  final String email;
  final bool showAlert;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BaseText(
          text: title,
          size: 20,
          bold: FontWeight.w600,
          color: Colors.white,
        ),
        BaseText(
          text: subtitle,
          color: Colors.white70,
        ),
        showAlert
            ? Container(
                height: 45,
                width: Get.width,
                margin: const EdgeInsets.symmetric(vertical: 20),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.red.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.warning,
                      size: 30,
                      color: Colors.red.shade800,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'OTP yang anda masukkan salah',
                        style: TextStyle(
                          color: Colors.red.shade800,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox(height: 20),
        Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: [
                TextSpan(
                  text: Get.currentRoute == '/sendOtp'
                      ? 'Kode OTP akan dikirim ke email '
                      : 'Kode OTP sudah dikirim ke email ',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: email,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
