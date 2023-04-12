import 'package:get/get.dart';
import 'package:collection/collection.dart';
import 'package:crud_with_softic/src/services/domain/localstorage/hive_config.dart';

class ThemeController extends GetxController {
  final config = HiveConfig();

  bool get isDarkMode => config.themeBox.values.firstOrNull ?? false;

  toggleAppTheme() {
    final oldValue = isDarkMode;
    config.themeBox.clear();
    config.themeBox.add(!oldValue);
    update();
  }
}
