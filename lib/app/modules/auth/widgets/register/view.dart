import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_appbar.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/auth/components/register/form_register.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: const BaseAppBar(
        title: '',
        preferredSize: Size.zero,
        bgColor: purpleColor,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height * 0.964,
          width: Get.width,
          child: Stack(
            children: [
              Positioned(
                top: 50,
                left: 0,
                right: 0,
                child: SvgPicture.asset(
                  'assets/images/logo_tri_white.svg',
                  width: 230,
                ),
              ),
              FormRegister(),
              Positioned(
                bottom: -85,
                left: -20,
                child: SvgPicture.asset(
                  'assets/images/footer_login.svg',
                  fit: BoxFit.cover,
                ),
              ),
              // SizedBox(
              //   width: Get.width,
              //   child: SvgPicture.asset(
              //     'assets/images/bg_register.svg',
              //     fit: BoxFit.cover,
              //   ),
              // ),
              // Positioned(
              //   top: 60,
              //   child: Padding(
              //     padding: const EdgeInsets.all(15),
              //     child: RichText(
              //       text: TextSpan(
              //         style: const TextStyle(
              //           fontSize: 14,
              //           color: Colors.black,
              //           fontFamily: 'Maison Neue',
              //         ),
              //         children: const [
              //           TextSpan(
              //             text:
              //                 'Dapatkan hadiah unik dari\nkami dengan bergabung\nsebagai member ',
              //           ),
              //           TextSpan(
              //             text: 'GRATIS!',
              //             style: TextStyle(fontWeight: FontWeight.bold),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // FormRegister(),
            ],
          ),
        ),
      ),
    );
  }
}
