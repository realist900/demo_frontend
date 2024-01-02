import 'package:demo_front/api/auth_api.dart';
import 'package:demo_front/api/cat_api.dart';
import 'package:demo_front/api/request/login_request.dart';
import 'package:demo_front/data/storage.dart';
import 'package:demo_front/dependency.dart';
import 'package:demo_front/model/cat.dart';
import 'package:demo_front/model/token_response.dart';
import 'package:demo_front/model/user.dart';
import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  final AuthApi authApi = Dependency.authApi;
  final Storage storage = Dependency.storage;

  String login = '';
  String password = '';

  Future<bool> auth() async {
    if (login.isEmpty || password.isEmpty) {
      return false;
    }
    try {
      final TokenResponse tokenResponse = await authApi.login(
        LoginRequest(
          login: login,
          password: password,
        ),
      );
      await storage.saveToken(accessToken: tokenResponse.accessToken);
      User user = await authApi.getUser();
      storage.saveUser(user);
    } catch (e) {
      return false;
    }

    return true;
  }
}
