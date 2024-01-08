import 'dart:convert';

import 'package:demo_front/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static const _accessToken = 'access_token';
  static const _userData = 'userData';

  final SharedPreferences _sharedPreferences;

  Storage({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  String? get accessToken => _sharedPreferences.getString(_accessToken);

  String? get userData => _sharedPreferences.getString(_userData);

  User? getUser() => userData != null ? User.fromJson(jsonDecode(userData!) as Map<String, dynamic>) : null;

  Future<void> saveToken({
    required String accessToken,
  }) async {
    await _sharedPreferences.setString(
      _accessToken,
      accessToken,
    );
  }

  Future<void> saveUser(User user) async {
    await _sharedPreferences.setString(
      _userData,
      jsonEncode(user.toJson()),
    );
  }

  Future<void> clearTokens() async {
    await _sharedPreferences.remove(_accessToken);
  }

  Future<void> clearUser() async {
    await _sharedPreferences.remove(_userData);
  }
}
