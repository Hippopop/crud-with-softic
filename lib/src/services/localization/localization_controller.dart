import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:crud_with_softic/src/constants/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'language_model.dart';

class LocalizationController extends GetxController implements GetxService {
  final SharedPreferences prefs;
  Map<String, Map<String, String>>? languageList;

  Locale locale = Locale(
    AppConstants.languages[0].languageCode!,
    AppConstants.languages[0].countryCode,
  );
  bool isLtr = true;

  LocalizationController({required this.prefs}) {
    loadCurrentLanguage();
  }

  /// Retrieving localization data from [.json] files.
  languageinit() async {
    Map<String, Map<String, String>> languages = {};
    for (LanguageModel languageModel in AppConstants.languages) {
      String string = await rootBundle.loadString(
        'assets/languages/${languageModel.languageCode}.json',
      );
      Map<String, dynamic> decodedJson = json.decode(string);
      Map<String, String> pursedMap = {};
      decodedJson.forEach((key, value) {
        pursedMap[key] = value.toString();
      });
      languages[languageModel.languageCode!] = pursedMap;
    }
    languageList = languages;
    update();
  }

  void setLanguage(Locale locale) {
    Get.updateLocale(locale);
    locale = locale;
    if (locale.languageCode == 'ar') {
      isLtr = false;
    } else {
      isLtr = true;
    }
    saveLanguage(locale);
    update();
  }

  void loadCurrentLanguage() async {
    locale = Locale(
        prefs.getString(AppConstants.languageCode) ??
            AppConstants.languages[0].languageCode!,
        prefs.getString(AppConstants.countryCode) ??
            AppConstants.languages[0].countryCode);
    isLtr = locale.languageCode != 'ar';
    update();
  }

  void saveLanguage(Locale locale) async {
    prefs.setString(AppConstants.languageCode, locale.languageCode);
    prefs.setString(AppConstants.countryCode, locale.countryCode!);
  }
}
