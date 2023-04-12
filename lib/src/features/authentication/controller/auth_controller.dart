import 'dart:developer';

import 'package:crud_with_softic/global/widgets/toast.dart';
import 'package:crud_with_softic/src/features/authentication/repository/database/auth_repository.dart';
import 'package:crud_with_softic/src/features/authentication/repository/local/local_auth_repository.dart';
import 'package:crud_with_softic/src/features/authentication/repository/models/login_request/login_request.dart';
import 'package:crud_with_softic/src/features/authentication/repository/models/user_profile/user_profile.dart';
import 'package:crud_with_softic/src/helpers/connectivity_check.dart';
import 'package:crud_with_softic/src/services/domain/database/request_handler.dart';
import 'package:crud_with_softic/src/services/domain/localstorage/hive_config.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthRepository _apiRepository = AuthRepository();
  final LocalAuthRepo _localAuthRepo = LocalAuthRepo();
  UserProfileModel? currentUserProfile;

  String? get currentAuthToken => _localAuthRepo.currentToken;
  LoginRequest? get currentUserCred => _localAuthRepo.currentUserCred;
  bool get isAuthenticated => currentAuthToken != null;

  Future<bool> login({
    required String name,
    required String password,
    required bool rememberMe,
  }) async {
    final loginData = LoginRequest(
      userName: name,
      password: password,
      rememberMe: rememberMe,
    );
    if (!await isConnected()) {
      showToast("Connect to the internet to login.");
      return false;
    }
    try {
      final data = await _apiRepository.requestLogin(requestData: loginData);
      if (data != null) {
        _localAuthRepo.saveToken(data);
        _apiRepository.requestHandler.updateToken(token: data);
        await getUserProfile();
        update();
        return true;
      } else {
        showToast('Login Error!');
        return false;
      }
    } catch (e, s) {
      log("#Login", error: e, stackTrace: s);
      if (e is RequestException) {
        showToast(e.msg);
      } else {
        showToast(e.toString());
      }
      return false;
    }
  }

  Future<void> getUserProfile() async {
    if (await isConnected()) {
      try {
        final data = await _apiRepository.requestProfile();
        if (data != null) {
          currentUserProfile = data;
          _localAuthRepo.saveProfile(data);
          update();
          showToast("Profile data updated!");
        } else {
          showToast('Profile fetch Error!');
        }
      } catch (e, s) {
        log("#Login", error: e, stackTrace: s);
        if (e is RequestException) {
          showToast(e.msg);
          if (e.statusCode == 401) {
            HiveConfig().dispose();
            update();
          }
        } else {
          showToast(e.toString());
        }
      }
    } else {
      showToast('Connect to network to update profile!');
      currentUserProfile = _localAuthRepo.currentProfile;
      update();
    }
  }
}
