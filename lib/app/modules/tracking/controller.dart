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

  @override
  void onInit() {
    fetchTracking();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetchTracking() async {
    try {
      final response = await trackingProvider.fetchTracking(Get.arguments);
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
