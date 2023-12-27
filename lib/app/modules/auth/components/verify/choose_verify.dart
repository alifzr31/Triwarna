import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/auth/widgets/verify/controller.dart';

class ChooseVerify extends StatelessWidget {
  ChooseVerify({super.key});
  final controller = Get.find<VerifyController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              children: const [
                TextSpan(
                  text:
                      'Pilih metode verikasi akun Anda untuk mendapatkan OTP\nvia ',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
                TextSpan(
                  text: 'WhatsApp ',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: 'atau link tautan via ',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
                TextSpan(
                  text: 'Email',
                  style: TextStyle(
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
                controller.chooseVerify.value = 'whatsapp';
                controller.chooseVerifyAccount();
              },
              icon: SvgPicture.asset(
                'assets/images/whatsapp_icon.svg',
                width: 23,
              ),
              label: RichText(
                textAlign: TextAlign.center,
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
                      text: 'WhatsApp',
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
                controller.chooseVerify.value = 'email';
                controller.chooseVerifyAccount();
              },
              icon: const Icon(EvaIcons.email),
              label: RichText(
                textAlign: TextAlign.center,
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
                        fontWeight: FontWeight.w600,
                        color: purpleColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
