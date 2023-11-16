import 'package:crud_with_softic/src/constants/assets.dart';
import 'package:crud_with_softic/src/services/localization/repository/model/app_language.dart';

class AppConstants {
  static const String countryCode = 'country_code';
  static const String languageCode = 'language_code';

  static List<AppLanguage> languages = [
    AppLanguage(
      imageUrl: Assets.us,
      languageName: 'ENGLISH',
      countryCode: 'US',
      languageCode: 'en',
    ),
    AppLanguage(
      imageUrl: Assets.bd,
      languageName: 'বাংলা',
      countryCode: 'BD',
      languageCode: 'bn',
    ),
  ];
}
