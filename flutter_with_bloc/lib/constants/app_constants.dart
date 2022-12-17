import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const String APP_TITLE = "Countries Info";
const String GENERIC_ERROR_MESSAGE = "Something went wrong";

final ThemeData APP_THEME = ThemeData(
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(3)))),
  scaffoldBackgroundColor: Colors.brown.shade50,
  appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      foregroundColor: Colors.black,
      systemOverlayStyle:
          SystemUiOverlayStyle(statusBarBrightness: Brightness.light)),
);
