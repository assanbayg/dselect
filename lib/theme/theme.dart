import 'package:flutter/material.dart';

const double largeTextSize = 26;
const double mediumTextSize = 18;
const double smallTextSize = 14;

const String fontNameDefault = 'Poppins';
const String fontNameTitle = '';

const Color colorText = Colors.black;
const Color primaryColor = Color.fromRGBO(110, 81, 208, 1);

ThemeData basisTheme() => ThemeData(
      brightness: Brightness.light,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: fontNameDefault,
      iconTheme: const IconThemeData(color: Colors.white),
      textTheme: const TextTheme(
        bodySmall: TextStyle(color: colorText, fontSize: smallTextSize),
        bodyMedium: TextStyle(color: colorText, fontSize: mediumTextSize),
        bodyLarge: TextStyle(
          color: colorText,
          fontSize: largeTextSize,
        ),
        headlineSmall: TextStyle(
          color: colorText,
          fontFamily: fontNameDefault,
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: TextStyle(
          color: colorText,
          fontFamily: fontNameDefault,
          fontWeight: FontWeight.w700,
        ),
        headlineLarge: TextStyle(
          color: colorText,
          fontFamily: fontNameDefault,
          fontWeight: FontWeight.w700,
        ),
        displaySmall: TextStyle(
          color: colorText,
          fontFamily: fontNameDefault,
          fontWeight: FontWeight.w700,
        ),
        displayMedium: TextStyle(
          color: colorText,
          fontFamily: fontNameDefault,
          fontWeight: FontWeight.w700,
        ),
        displayLarge: TextStyle(
          color: colorText,
          fontFamily: fontNameDefault,
          fontWeight: FontWeight.w700,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(120, 50),
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          textStyle: const TextStyle(
            fontFamily: fontNameDefault,
            fontSize: mediumTextSize,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorText,
          textStyle: const TextStyle(
            fontFamily: fontNameDefault,
            fontSize: mediumTextSize,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
