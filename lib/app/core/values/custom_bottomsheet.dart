import 'package:flutter/material.dart';
import 'package:get/get.dart';

void customBottomSheet(double? height, Widget child) {
  Get.bottomSheet(
    backgroundColor: Colors.white,
    clipBehavior: Clip.antiAlias,
    
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    ),
    SizedBox(
      height: height,
      width: Get.width,
      child: child,
    ),
  );
}
