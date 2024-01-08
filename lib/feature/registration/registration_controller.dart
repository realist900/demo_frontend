import 'package:demo_front/api/auth_api.dart';
import 'package:demo_front/api/request/register_request.dart';
import 'package:demo_front/dependency.dart';
import 'package:flutter/material.dart';

class RegistrationController extends ChangeNotifier {
  final AuthApi authApi = Dependency.authApi;
  String login = '';
  String password = '';
  String name = '';
  String email = '';

  Future<bool> register() async {
    if (login.isEmpty || password.isEmpty || name.isEmpty || email.isEmpty) {
      return false;
    }
    try {
      await authApi.register(
        RegisterRequest(
          login: login,
          password: password,
          name: name,
          email: email,
        ),
      );
    } catch (e) {
      print(e);
      return false;
    }

    return true;
  }
}
