import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';

void showLoading() {
  Get.dialog(
    barrierDismissible: false,
    const Center(
      child: CircularProgressIndicator(
        color: yellowColor,
        backgroundColor: softYellowColor,
      ),
    ),
  );
}
