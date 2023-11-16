import 'dart:async';

import 'package:crud_with_softic/src/services/localization/repository/model/app_language.dart';

abstract class LanguageRepository {
  FutureOr<void> saveLanguage(AppLanguage language);
  FutureOr<AppLanguage> fetchLanguage();
}
