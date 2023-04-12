import 'package:crud_with_softic/src/constants/assets.dart';
import 'package:crud_with_softic/src/services/localization/language_model.dart';

class AppConstants {
  static const String theme = 'theme';
  static const String countryCode = 'country_code';
  static const String languageCode = 'language_code';

  static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: Assets.us,
        languageName: 'ENGLISH',
        countryCode: 'US',
        languageCode: 'en'),
    LanguageModel(
        imageUrl: Assets.bd,
        languageName: 'বাংলা',
        countryCode: 'BD',
        languageCode: 'bn'),
  ];
}
