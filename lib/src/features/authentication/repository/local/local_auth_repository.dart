import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:crud_with_softic/src/features/authentication/repository/models/login_request/login_request.dart';
import 'package:crud_with_softic/src/features/authentication/repository/models/user_profile/user_profile.dart';
import 'package:crud_with_softic/src/services/domain/localstorage/hive_config.dart';

class LocalAuthRepo {
  final config = HiveConfig();
  saveLoginCred(LoginRequest data) {
    config.loginCredBox.clear();
    config.loginCredBox.add(data);
  }

  saveToken(String token) {
    config.tokenBox.clear();
    config.tokenBox.add(token);
  }

  saveProfile(UserProfileModel profile) {
    config.profileBox.clear();
    config.profileBox.add(json.encode(profile.toJson()));
  }

  LoginRequest? get currentUserCred => config.loginCredBox.values.firstOrNull;

  String? get currentToken => config.tokenBox.values.firstOrNull;

  UserProfileModel? get currentProfile {
    String? data = config.profileBox.values.firstOrNull;
    if (data != null) {
      return UserProfileModel.fromJson(json.decode(data));
    }
    return null;
  }
}
