import 'package:flutter/material.dart';

TextTheme customTextTheme() {
  return const TextTheme(
      titleLarge: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'poppins',
      ),
      titleSmall : TextStyle(
        fontSize: 16.0,
        color: Colors.grey,
      )
    // Add more custom text styles as needed
  );
}