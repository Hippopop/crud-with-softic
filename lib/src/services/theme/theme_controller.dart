import 'package:get/get.dart';
import 'package:crud_with_softic/src/services/domain/localstorage/hive_config.dart';

class ThemeController extends GetxController {
  static const String key = '#THEMEMODE';
  final config = HiveConfig();

  bool get isDarkMode => config.themeBox.get(key) ?? false;

  toggleAppTheme() {
    final oldValue = isDarkMode;
    config.themeBox.put(key, !oldValue);
    update();
  }
}
