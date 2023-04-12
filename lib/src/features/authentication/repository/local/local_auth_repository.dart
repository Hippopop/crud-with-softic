import 'dart:convert';

import 'package:crud_with_softic/src/features/authentication/repository/models/login_request/login_request.dart';
import 'package:crud_with_softic/src/features/authentication/repository/models/user_profile/user_profile.dart';
import 'package:crud_with_softic/src/services/domain/localstorage/hive_config.dart';

class LocalAuthRepo {
  final config = HiveConfig();
  static const tokenKey = '#TOKEN_KEY';
  static const loginCredKey = '#CRED_KEY';
  static const profileKey = '#PROFILE_KEY';

  saveLoginCred(LoginRequest data) =>
      config.loginCredBox.put(loginCredKey, data);

  saveToken(String token) => config.tokenBox.put(tokenKey, token);

  saveProfile(UserProfileModel profile) => config.profileBox.put(
        profileKey,
        json.encode(profile.toJson()),
      );

  LoginRequest? get currentUserCred => config.loginCredBox.get(loginCredKey);

  String? get currentToken => config.tokenBox.get(tokenKey);

  UserProfileModel? get currentProfile {
    String? data = config.profileBox.get(profileKey);
    if (data != null) {
      return UserProfileModel.fromJson(json.decode(data));
    }
    return null;
  }
}
