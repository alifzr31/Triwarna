import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/forgot_pin/send_otp/controller.dart';

class SendOtpBody extends StatelessWidget {
  SendOtpBody({super.key});
  final controller = Get.find<SendOtpController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BaseText(
            text: 'Lupa PIN',
            size: 20,
            bold: FontWeight.w600,
            color: Colors.white,
          ),
          const BaseText(
            text: 'Silahkan pilih metode verifikasi via email atau whatsapp',
            color: Colors.white70,
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: Get.width,
            child: ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor:
                    const MaterialStatePropertyAll(softPurpleColor),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () {
                controller.type.value = 'wa';
                controller.sendOtp();
              },
              icon: SvgPicture.asset(
                'assets/images/whatsapp_icon.svg',
                width: 23,
              ),
              label: RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: const [
                    TextSpan(
                      text: 'via ',
                      style: TextStyle(
                        color: purpleColor,
                      ),
                    ),
                    TextSpan(
                      text: 'Whatsapp',
                      style: TextStyle(
                        color: purpleColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: Get.width,
            child: ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor:
                    const MaterialStatePropertyAll(softPurpleColor),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () {
                controller.type.value = 'email';
                controller.sendOtp();
              },
              icon: const Icon(EvaIcons.email),
              label: RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: const [
                    TextSpan(
                      text: 'via ',
                      style: TextStyle(
                        color: purpleColor,
                      ),
                    ),
                    TextSpan(
                      text: 'Email',
                      style: TextStyle(
                        color: purpleColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
