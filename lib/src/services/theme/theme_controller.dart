import 'package:crud_with_softic/src/services/theme/dark_theme.dart';
import 'package:crud_with_softic/src/services/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crud_with_softic/src/services/domain/localstorage/hive_config.dart';

class ThemeController extends GetxController {
  static const String key = '#THEMEMODE';
  final config = HiveConfig();

  bool? get isDarkMode => config.themeBox.get(key);

  ThemeData get currentTheme {
    if (isDarkMode == null) return light;
    return isDarkMode! ? dark : light;
  }

  toggleAppTheme() {
    final oldValue = isDarkMode ?? false;
    config.themeBox.put(key, !oldValue);
    update();
  }
}
