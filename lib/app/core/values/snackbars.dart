import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';

void successSnackbar(String title, String message) {
  Get.snackbar(
    title,
    message,
    titleText: BaseText(
      text: title,
      bold: FontWeight.bold,
    ),
    messageText: BaseText(
      text: message,
      bold: FontWeight.w600,
    ),
    margin: const EdgeInsets.all(15),
    borderRadius: 10,
    icon: Icon(
      CupertinoIcons.check_mark_circled,
      color: Colors.green.shade800,
      size: 30,
    ),
    boxShadows: const [
      BoxShadow(
        color: Colors.grey,
        blurRadius: 3,
        offset: Offset(1, 2),
        spreadRadius: 1,
      ),
    ],
    backgroundColor: baseBgScaffold,
    colorText: Colors.black,
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    shouldIconPulse: false,
  );
}

void failedSnackbar(String title, String message) {
  Get.snackbar(
    title,
    message,
    titleText: BaseText(
      text: title,
      bold: FontWeight.bold,
    ),
    messageText: BaseText(
      text: message,
      bold: FontWeight.w600,
    ),
    margin: const EdgeInsets.all(15),
    borderRadius: 10,
    icon: Icon(
      CupertinoIcons.xmark_circle,
      color: Colors.red.shade800,
      size: 30,
    ),
    boxShadows: const [
      BoxShadow(
        color: Colors.grey,
        blurRadius: 3,
        offset: Offset(1, 2),
        spreadRadius: 1,
      ),
    ],
    backgroundColor: baseBgScaffold,
    colorText: Colors.black,
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    shouldIconPulse: false,
  );
}

void infoSnackbar(String title, String message) {
  Get.snackbar(
    title,
    message,
    titleText: BaseText(
      text: title,
      bold: FontWeight.bold,
    ),
    messageText: BaseText(
      text: message,
      bold: FontWeight.w600,
    ),
    margin: const EdgeInsets.all(15),
    borderRadius: 10,
    icon: Icon(
      Icons.info,
      color: Colors.blue.shade800,
      size: 30,
    ),
    boxShadows: const [
      BoxShadow(
        color: Colors.grey,
        blurRadius: 3,
        offset: Offset(1, 2),
        spreadRadius: 1,
      ),
    ],
    backgroundColor: baseBgScaffold,
    colorText: Colors.black,
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    shouldIconPulse: false,
  );
}
