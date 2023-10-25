import 'dart:async';

import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateController extends GetxController {
  final playStoreUrl = Rx<String?>(null);
  final updateVersion = Rx<String?>(null);
  final currentVersion = Rx<String?>(null);

  @override
  void onInit() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    currentVersion.value = packageInfo.version;
    playStoreUrl.value = Get.arguments[0];
    updateVersion.value = Get.arguments[1];
    super.onInit();
  }

  Future<void> updatePlayStore() async {
    final url = Uri.parse(playStoreUrl.value ?? '');
    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  }

  void navigator() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final opened = prefs.getBool('opened');
    
    if (opened == true || opened != null) {
      Get.offAndToNamed('/dashboard');
    } else {
      Get.offAndToNamed('/onboard');
    }
  }
}
