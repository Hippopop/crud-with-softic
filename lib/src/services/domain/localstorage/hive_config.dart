import 'package:crud_with_softic/src/features/authentication/repository/models/login_request/login_request.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveConfig {
  static const tokenKey = 'USER_TOKEN';
  static const themeKey = 'APP_THEME';
  static const profileKey = 'USER_PROFILE';
  static const productKey = 'USER_PRODUCT';
  static const loginCredKey = 'LOGIN_CREDENTIAL';
  static Future<void> initialize() async {
    await Hive.initFlutter();
    await Hive.openBox<bool>(themeKey);
    await Hive.openBox<String>(tokenKey);
    await Hive.openBox<String>(profileKey);
    await Hive.openBox<String>(productKey);
    await Hive.openBox<LoginRequestAdapter>(loginCredKey);
  }

  Box<bool> get themeBox => Hive.box(themeKey);
  Box<String> get tokenBox => Hive.box(tokenKey);
  Box<String> get profileBox => Hive.box(profileKey);
  Box<String> get productBox => Hive.box(profileKey);
  Box<LoginRequest> get loginCredBox => Hive.box(loginCredKey);

  Future<void> dispose() async {
    tokenBox.clear();
    profileBox.clear();
  }
}
