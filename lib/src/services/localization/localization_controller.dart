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
  LocalizationController({required this.prefs}) {
    loadCurrentLanguage();
  }

  /// Retrieving localization data from [.json] files.
  languageinit() async {
    Map<String, Map<String, String>> languages = {};
    for (LanguageModel languageModel in AppConstants.languages) {
      String jsonStringValues = await rootBundle
          .loadString('assets/languages/${languageModel.languageCode}.json');
      Map<String, dynamic> decodedJson = json.decode(jsonStringValues);
      Map<String, String> pursedMap = {};
      decodedJson.forEach((key, value) {
        pursedMap[key] = value.toString();
      });
      languages['${languageModel.languageCode}_${languageModel.countryCode}'] =
          pursedMap;
    }
    languageList = languages;
    update();
  }

  Locale _locale = Locale(AppConstants.languages[0].languageCode!,
      AppConstants.languages[0].countryCode);
  bool _isLtr = true;
  Locale get locale => _locale;
  bool get isLtr => _isLtr;

  void setLanguage(Locale locale) {
    Get.updateLocale(locale);
    _locale = locale;
    if (_locale.languageCode == 'ar') {
      _isLtr = false;
    } else {
      _isLtr = true;
    }
    saveLanguage(_locale);
    update();
  }

  void loadCurrentLanguage() async {
    _locale = Locale(
        prefs.getString(AppConstants.languageCode) ??
            AppConstants.languages[0].languageCode!,
        prefs.getString(AppConstants.countryCode) ??
            AppConstants.languages[0].countryCode);
    _isLtr = _locale.languageCode != 'ar';
    update();
  }

  void saveLanguage(Locale locale) async {
    prefs.setString(AppConstants.languageCode, locale.languageCode);
    prefs.setString(AppConstants.countryCode, locale.countryCode!);
  }
}
