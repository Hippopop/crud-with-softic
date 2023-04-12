import 'package:flutter/material.dart';

import '../../src/features/authentication/view/login_screen.dart';
import '../../src/services/localization/choose_language_screen.dart';
import '../../src/services/settings/main_settings.dart';

var routes = <String, WidgetBuilder>{
  LoginScreen.screen: (_) => const LoginScreen(),
  AppMainSettings.screen: (_) => const AppMainSettings(),
  ChooseLanguageScreen.screen: (_) => const ChooseLanguageScreen(),
};
