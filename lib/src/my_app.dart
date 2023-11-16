import 'package:crud_with_softic/src/constants/app_constants.dart';
import 'package:crud_with_softic/src/features/authentication/controller/auth_controller.dart';
import 'package:crud_with_softic/src/services/localization/translate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/authentication/view/login_screen.dart';
import 'features/home/view/home_screen.dart';
import 'services/localization/localization_controller.dart';
import 'services/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
      builder: (localizeController) {
        return GetBuilder<AuthController>(builder: (authController) {
          return GetBuilder<ThemeController>(builder: (themeController) {
            return GetMaterialApp(
              theme: themeController.currentTheme,
              // darkTheme: dark,
              // themeMode: themeController.isDarkMode ? ThemeMode.dark : ThemeMode.light,
              title: 'CRUD with SOFTIC',
              locale: localizeController.locale,
              debugShowCheckedModeBanner: false,
              translations:
                  Translate(languages: localizeController.languageList!),
              fallbackLocale: Locale(
                AppConstants.languages[0].languageCode,
                AppConstants.languages[0].countryCode,
              ),
              home: (authController.isAuthenticated)
                  ? const HomeScreen()
                  : const LoginScreen(),
            );
          });
        });
      },
    );
  }
}
