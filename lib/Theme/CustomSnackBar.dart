import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Snackbar {
  static void success(String message) {
    GetSnackBar(
      // title: title,
      message: message,
      backgroundColor: Colors.green, // Customize the background color
      duration: const Duration(seconds: 3), // Customize the duration
      borderRadius: 10, // Customize the border radius
      icon: const Icon(Icons.check_circle, color: Colors.white), // Customize the icon
      shouldIconPulse: true,
      barBlur: 20,
      overlayBlur: 0,
      animationDuration: const Duration(milliseconds: 500),
      forwardAnimationCurve: Curves.fastOutSlowIn,
      reverseAnimationCurve: Curves.fastEaseInToSlowEaseOut,
      isDismissible: true,
      snackPosition: SnackPosition.TOP, // Customize the snackbar position
      margin: const EdgeInsets.all(10), // Customize the margin
      padding: const EdgeInsets.all(20), // Customize the padding
      mainButton: TextButton(
        onPressed: () {
          Get.back(); // Close the snackbar when the button is pressed
        },
        child: const Icon(
          Icons.close,color: Colors.white, // Customize the button text color
        ),
      ),
      showProgressIndicator: false, // Set to true if you want to show a loading indicator
      progressIndicatorBackgroundColor: Colors.white,
    ).show();
  }
  static void error(String message) {
    GetSnackBar(
      // title: title,
      message: message,
      backgroundColor: Colors.red, // Customize the background color
      duration: const Duration(seconds: 3), // Customize the duration
      borderRadius: 10, // Customize the border radius
      icon: const Icon(Icons.check_circle, color: Colors.white), // Customize the icon
      shouldIconPulse: true,
      barBlur: 20,
      overlayBlur: 0,
      animationDuration: const Duration(milliseconds: 500),
      forwardAnimationCurve: Curves.fastOutSlowIn,
      reverseAnimationCurve: Curves.fastEaseInToSlowEaseOut,
      isDismissible: true,
      snackPosition: SnackPosition.TOP, // Customize the snackbar position
      margin: const EdgeInsets.all(10), // Customize the margin
      padding: const EdgeInsets.all(20), // Customize the padding
      mainButton: TextButton(
        onPressed: () {
          Get.back(); // Close the snackbar when the button is pressed
        },
        child: const Icon(
          Icons.close,color: Colors.white, // Customize the button text color
        ),
      ),
      showProgressIndicator: false, // Set to true if you want to show a loading indicator
      progressIndicatorBackgroundColor: Colors.white,
    ).show();
  }
}
