import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_appbar.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/auth/components/login/form_login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                top: 70,
                left: 0,
                right: 0,
                child: SvgPicture.asset(
                  'assets/images/logo_tri_white.svg',
                  width: 230,
                ),
              ),
              FormLogin(),
              Positioned(
                bottom: -85,
                left: -20,
                child: SvgPicture.asset(
                  'assets/images/footer_login.svg',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
