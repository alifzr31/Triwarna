import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/update_apps/controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(backgroundColor: purpleColor, body: SplashBody()),
    );
  }
}

class SplashBody extends StatelessWidget {
  SplashBody({super.key});
  final controller = Get.put(UpdateController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Stack(
            children: [
              Center(
                child: Lottie.asset(
                  'assets/lotties/splash.json',
                  width: 150,
                  frameRate: FrameRate(240),
                  repeat: true,
                ),
              ),
              // Positioned(
              //   bottom: 200,
              //   left: 0,
              //   right: 0,
              //   child: Center(
              //     child: CircularProgressIndicator(color: yellowColor),
              //   ),
              // ),
              // const Positioned(
              //   bottom: 0,
              //   left: 0,
              //   right: 0,
              //   child: Center(
              //     child: Column(
              //       children: [
              //         Text(
              //           'Powered By',
              //           style: TextStyle(
              //             fontSize: 16,
              //             fontWeight: FontWeight.w600,
              //             color: yellowColor,
              //           ),
              //         ),
              //         Text(
              //           'DEV-IT Anyargroup',
              //           style: TextStyle(
              //             fontWeight: FontWeight.w600,
              //             color: yellowColor,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
