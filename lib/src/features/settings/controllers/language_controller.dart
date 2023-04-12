import 'package:crud_with_softic/src/constants/app_constants.dart';
import 'package:get/get.dart';

import '../../../services/localization/language_model.dart';

class LanguageController extends GetxController {
  int selectIndex = 0;

  void setSelectIndex(int index) {
    selectIndex = index;
    update();
  }

  List<LanguageModel> get languages => AppConstants.languages;
}
