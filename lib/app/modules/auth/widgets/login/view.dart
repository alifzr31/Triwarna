import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/modules/auth/components/login/form_login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                  'assets/images/bg_login.svg',
                  fit: BoxFit.cover,
                ),
              ),
              FormLogin(),
            ],
          ),
        ),
      ),
    );
  }
}
