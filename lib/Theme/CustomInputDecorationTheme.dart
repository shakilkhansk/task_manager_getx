import 'package:flutter/material.dart';

InputDecorationTheme customInputDecorationTheme() {
  return const InputDecorationTheme(
    labelStyle: TextStyle(
      fontSize: 16.0,
      // color: Colors.blue,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(103, 58, 183, 100), width: 1.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 1.0),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 1.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 1.0),
    ),
    errorStyle: TextStyle(
      color: Colors.red,
      fontSize: 14.0,
    ),
  );
}