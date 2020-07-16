import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarUtil {
  static void showSuccess(String message) {
    Get.rawSnackbar(
      title: 'Success',
      icon: Icon(
        Icons.thumb_up,
        color: Colors.white,
      ),
      message: message,
      backgroundColor: Colors.green[600],
      instantInit: true,
    );
  }

  static void showWarning(String message) {
    Get.rawSnackbar(
      title: 'Warning',
      icon: Icon(
        Icons.warning,
        color: Colors.white,
      ),
      message: message,
      backgroundColor: Colors.orange[900],
      instantInit: true,
    );
  }

  static void showError(String message) {
    Get.rawSnackbar(
      title: 'Error',
      icon: Icon(
        Icons.error,
        color: Colors.white,
      ),
      message: message,
      backgroundColor: Colors.redAccent[700],
      instantInit: true,
    );
  }
}