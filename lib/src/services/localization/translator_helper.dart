import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:crud_with_softic/src/constants/app_constants.dart';
import 'package:crud_with_softic/src/services/localization/language_model.dart';

/// Retrieving localization data from [.json] files.
Future<Map<String, Map<String, String>>> languageinit() async {
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
  return languages;
}
