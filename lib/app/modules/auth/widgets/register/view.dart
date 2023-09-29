import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/modules/auth/components/register/form_register.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Stack(
            children: [
              SizedBox(
                width: Get.width,
                child: SvgPicture.asset(
                  'assets/images/bg_register.svg',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 60,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontFamily: 'Maison Neue',
                      ),
                      children: const [
                        TextSpan(
                          text:
                              'Dapatkan hadiah unik dari\nkami dengan bergabung\nsebagai member ',
                        ),
                        TextSpan(
                          text: 'GRATIS!',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              FormRegister(),
            ],
          ),
        ),
      ),
    );
  }
}
