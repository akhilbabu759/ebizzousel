import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SnackBarPop {
  static Future<void> popUp(String text, Color color) async {
    Get.snackbar(
      text,
      "",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: color,
      borderRadius: 20,
      margin: const EdgeInsets.all(15),
      colorText: Colors.white,
      duration: const Duration(seconds: 4),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
}
