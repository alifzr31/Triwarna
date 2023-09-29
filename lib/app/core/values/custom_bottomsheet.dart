import 'package:flutter/material.dart';
import 'package:get/get.dart';

void customBottomSheet(double? height, Widget child) {
  Get.bottomSheet(
    backgroundColor: Colors.white,
    SizedBox(
      height: height,
      width: Get.width,
      child: child,
    ),
  );
}
