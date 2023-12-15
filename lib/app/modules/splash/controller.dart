import 'dart:async';

import 'package:app_version_update/app_version_update.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    await checkUpdate();
    super.onInit();
  }

  Future<void> checkUpdate() async {
    try {
      final result = await AppVersionUpdate.checkForUpdates(
        playStoreId: 'id.co.triwarna.member',
        appleId: '6451289751',
        country: 'id',
      );

      if (result.canUpdate!) {
        await Future.delayed(const Duration(seconds: 3), () {
          Get.offAndToNamed(
            '/update',
            arguments: [
              result.storeUrl,
              result.storeVersion,
            ],
          );
        });
      } else {
        navigator();
      }
    } on Error catch (e) {
      if (kDebugMode) {
        print(e);
        rethrow;
      }
    }
  }

  void navigator() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final opened = prefs.getBool('opened');

    Timer(const Duration(seconds: 3), () {
      if (opened == true || opened != null) {
        Get.offAndToNamed('/dashboard');
      } else {
        Get.offAndToNamed('/onboard');
      }
    });
  }
}
