import 'package:crud_with_softic/src/constants/app_constants.dart';
import 'package:get/get.dart';

import '../../../services/localization/repository/model/app_language.dart';

class LanguageController extends GetxController {
  int selectIndex = 0;

  void setSelectIndex(int index) {
    selectIndex = index;
    update();
  }

  List<AppLanguage> get languages => AppConstants.languages;
}
