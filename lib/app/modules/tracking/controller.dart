import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/core/values/snackbars.dart';
import 'package:triwarna_rebuild/app/data/models/tracking.dart';
import 'package:triwarna_rebuild/app/data/providers/tracking_provider.dart';

class TrackingController extends GetxController {
  final TrackingProvider trackingProvider;

  TrackingController({required this.trackingProvider});

  final isLoading = true.obs;
  final tracking = Rx<Tracking?>(null);
  final serialNumber = Rx<String?>(null);
  final complete = false.obs;

  @override
  void onInit() {
    serialNumber.value = Get.arguments['serialNumber'];
    complete.value = Get.arguments['complete'];
    fetchTracking();
    super.onInit();
  }

  Future<void> fetchTracking() async {
    try {
      final response = await trackingProvider.fetchTracking(serialNumber.value);
      tracking.value = trackingFromJson(jsonEncode(response.data['data']));
    } on DioException catch (e) {
      failedSnackbar(
        'Ups sepertinya terjadi kesalahan',
        'code:${e.response?.statusCode}',
      );
      if (e.response?.statusCode == 500) {}
    } finally {
      isLoading.value = false;
      update();
    }
  }
}
