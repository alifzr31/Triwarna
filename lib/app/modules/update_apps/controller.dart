import 'dart:async';

// import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_version_update/app_version_update.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdateController extends GetxController {
  final playStoreUrl = Rx<String?>(null);
  final updateVersion = Rx<String?>(null);

  @override
  void onInit() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      checkUpdate();
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      navigator();
    } else {
      navigator();
    }
    super.onInit();
  }

  Future<void> checkUpdate() async {
    await AppVersionUpdate.checkForUpdates(
      playStoreId: 'id.co.triwarna.member',
      country: 'id',
    ).then((result) async {
      playStoreUrl.value = result.storeUrl;
      updateVersion.value = result.storeVersion;

      if (result.canUpdate!) {
        await Future.delayed(const Duration(seconds: 3), () {
          Get.offAndToNamed('/update');
        });
      } else {
        navigator();
      }
    });
  }

  Future<void> navigator() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final opened = sharedPreferences.getBool('opened');
    print(opened);

    Timer(const Duration(seconds: 3), () {
      if (opened == true) {
        Get.offAllNamed('/dashboard');
      } else {
        Get.offAllNamed('/onboard');
      }
    });
  }

  Future<void> updatePlayStore() async {
    final url = Uri.parse(playStoreUrl.value ?? '');
    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  }
}
