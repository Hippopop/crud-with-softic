import 'package:flutter/material.dart';

class ColorTheme extends ThemeExtension<ColorTheme> {
  final Color opposite;
  final Color themeColor;
  final Color extraColor;
  final Color mainAccent;
  final Color primaryColor;
  final Color primaryAccent;
  final Color secoderyAccent;
  final Color extraTextColor;
  final Color backgroundColor;
  ColorTheme({
    required this.themeColor,
    required this.opposite,
    required this.extraColor,
    required this.mainAccent,
    required this.primaryColor,
    required this.primaryAccent,
    required this.secoderyAccent,
    required this.extraTextColor,
    required this.backgroundColor,
  });

  @override
  ColorTheme copyWith({
    Color? black,
    Color? white,
    Color? mainAccent,
    Color? extraColor,
    Color? primaryColor,
    Color? primaryAccent,
    Color? secoderyAccent,
    Color? extraTextColor,
    Color? backgroundColor,
  }) {
    return ColorTheme(
      opposite: white ?? this.opposite,
      themeColor: black ?? this.themeColor,
      mainAccent: mainAccent ?? this.mainAccent,
      extraColor: extraColor ?? this.extraColor,
      primaryColor: primaryColor ?? this.primaryColor,
      primaryAccent: primaryAccent ?? this.primaryAccent,
      secoderyAccent: secoderyAccent ?? this.secoderyAccent,
      extraTextColor: extraTextColor ?? this.extraTextColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  ThemeExtension<ColorTheme> lerp(
      covariant ThemeExtension<ColorTheme>? other, double t) {
    if (other is! ColorTheme) return this;
    return ColorTheme(
      opposite: Color.lerp(opposite, other.opposite, t)!,
      themeColor: Color.lerp(themeColor, other.themeColor, t)!,
      mainAccent: Color.lerp(mainAccent, other.mainAccent, t)!,
      extraColor: Color.lerp(extraColor, other.extraColor, t)!,
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      primaryAccent: Color.lerp(primaryAccent, other.primaryAccent, t)!,
      secoderyAccent: Color.lerp(secoderyAccent, other.secoderyAccent, t)!,
      extraTextColor: Color.lerp(extraTextColor, other.extraTextColor, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
    );
  }
}
