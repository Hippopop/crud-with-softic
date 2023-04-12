import 'dart:developer';

import 'package:crud_with_softic/src/features/authentication/repository/models/login_request/login_request.dart';
import 'package:crud_with_softic/src/features/authentication/repository/models/user_profile/user_profile.dart';
import 'package:crud_with_softic/src/services/domain/database/request_handler.dart';
import 'package:crud_with_softic/src/services/domain/database/api_repository.dart';

class AuthRepository extends ApiRepository {
  static const loginPath = '/authenticate';
  static const profilePath = '/account';

  Future<String?> requestLogin({required LoginRequest requestData}) async {
    final res = await requestHandler.post(loginPath, requestData.toJson());
    if (res is! RequestException) {
      try {
        return (res as Map<String, dynamic>)['id_token'] as String;
      } catch (e, s) {
        log('#UNCAUGHT ERROR', error: e, stackTrace: s);
        rethrow;
      }
    } else {
      throw res;
    }
  }

  Future<UserProfileModel?> requestProfile() async {
    final res = await requestHandler.get(profilePath);
    if (res is! RequestException) {
      try {
        return UserProfileModel.fromJson(res);
      } catch (e, s) {
        log('#UNCAUGHT ERROR', error: e, stackTrace: s);
        rethrow;
      }
    } else {
      throw res;
    }
  }
}
