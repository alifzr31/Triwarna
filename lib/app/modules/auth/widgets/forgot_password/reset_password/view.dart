import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/auth/components/forgot_password/form_resetpassword.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Stack(
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
              FormResetPassword(),
            ],
          ),
        ),
      ),
    );
  }
}
