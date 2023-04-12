import 'package:flutter/material.dart';
import 'package:crud_with_softic/src/constants/app_constants.dart';
import 'package:crud_with_softic/src/features/home/view/home_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'src/features/authentication/controller/auth_controller.dart';
import 'src/services/localization/localization_controller.dart';
import 'src/helpers/getit_locator.dart' as getit_locator;
import 'src/services/localization/translate.dart';
import 'src/features/authentication/view/login_screen.dart';
import 'src/services/theme/dark_theme.dart';
import 'src/services/theme/light_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await getit_locator.init(prefs);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
      builder: (localizeController) {
        return GetBuilder<AuthController>(builder: (authController) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Demo Project',
            themeMode: ThemeMode.system,
            theme: light,
            darkTheme: dark,
            locale: localizeController.locale,
            translations:
                Translate(languages: localizeController.languageList!),
            fallbackLocale: Locale(
              AppConstants.languages[0].languageCode!,
              AppConstants.languages[0].countryCode,
            ),
            home: (authController.isAuthenticated)
                ? const HomeScreen()
                : const LoginScreen(),
          );
        });
      },
    );
  }
}
