import 'package:crud_with_softic/src/features/home/controller/product_controller.dart';
import 'package:crud_with_softic/src/services/domain/database/request_handler.dart';
import 'package:crud_with_softic/src/services/domain/localstorage/hive_config.dart';
import 'package:crud_with_softic/src/features/settings/controllers/language_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../features/authentication/controller/auth_controller.dart';
import '../services/localization/localization_controller.dart';
import '../services/theme/theme_controller.dart';

Future init(SharedPreferences prefs) async {
  await HiveConfig.initialize();
  Get.put(RequestHandler(), permanent: true);
  Get.put(ThemeController(), permanent: true);
  await Get.put(LocalizationController(prefs: prefs), permanent: true)
      .languageinit();

  // Controllers
  Get.put(ProductController());
  Get.lazyPut(() => LanguageController());
  final controller = Get.put(AuthController());
  if (controller.isAuthenticated) {
    Get.find<RequestHandler>().updateToken(token: controller.currentAuthToken!);
    await controller.getUserProfile();
  }
}
