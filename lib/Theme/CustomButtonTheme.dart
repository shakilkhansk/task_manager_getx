import 'package:flutter/material.dart';

ElevatedButtonThemeData customButtonTheme() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: TextStyle(fontSize: 16,
        fontFamily: 'poppins',
      ),
      padding: const EdgeInsets.symmetric(vertical: 14),
      foregroundColor: Colors.white,
      backgroundColor: const Color.fromRGBO(103, 58, 183, 100),
      side: const BorderSide(color: Color.fromRGBO(103, 58, 183, 100)),
      shadowColor: const Color.fromRGBO(103, 58, 183, 100),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
  );
}