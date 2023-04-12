import 'package:flutter/material.dart';

import 'extensions/color_theme.dart';

ThemeData light = ThemeData(
  fontFamily: 'montserrat',
  brightness: Brightness.light,
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  extensions: {
    ColorTheme(
      opposite: Colors.black,
      themeColor: Colors.white,
      extraColor: const Color(0xffF8B6C0),
      mainAccent: const Color(0xffF2B872),
      primaryColor: const Color(0xff3084F2),
      primaryAccent: const Color(0xff96D9A0),
      extraTextColor: const Color(0xff3B3C40),
      secoderyAccent: const Color(0xffA0ACF2),
      backgroundColor: const Color(0xffF2F2F2),
    ),
  },
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
      TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
    },
  ),
);
