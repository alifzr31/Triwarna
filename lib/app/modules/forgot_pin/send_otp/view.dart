import 'package:flutter/material.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/forgot_pin/send_otp/widgets/sendotp_body.dart';

class SendOtpPage extends StatelessWidget {
  const SendOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      body: SendOtpBody(),
    );
  }
}
