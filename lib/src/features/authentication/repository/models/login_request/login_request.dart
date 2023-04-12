import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';

part 'login_request.g.dart';

@HiveType(typeId: 0)
class LoginRequest {
  @HiveField(0)
  String userName;
  @HiveField(1)
  String password;
  @HiveField(2)
  bool rememberMe;
  LoginRequest({
    required this.userName,
    required this.password,
    required this.rememberMe,
  });

  LoginRequest copyWith({
    String? userName,
    String? password,
    bool? rememberMe,
  }) {
    return LoginRequest(
      userName: userName ?? this.userName,
      password: password ?? this.password,
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': userName,
      'password': password,
      'rememberMe': rememberMe,
    };
  }

  factory LoginRequest.fromMap(Map<String, dynamic> map) {
    return LoginRequest(
      userName: map['username'] as String,
      password: map['password'] as String,
      rememberMe: map['rememberMe'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginRequest.fromJson(String source) =>
      LoginRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'LoginRequest(userName: $userName, password: $password, rememberMe: $rememberMe)';

  @override
  bool operator ==(covariant LoginRequest other) {
    if (identical(this, other)) return true;

    return other.userName == userName &&
        other.password == password &&
        other.rememberMe == rememberMe;
  }

  @override
  int get hashCode =>
      userName.hashCode ^ password.hashCode ^ rememberMe.hashCode;
}
