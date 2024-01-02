import 'package:demo_front/api/common/authorization_interceptor.dart';
import 'package:demo_front/dependency.dart';
import 'package:demo_front/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'data/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Dependency.storage = Storage(sharedPreferences: await SharedPreferences.getInstance());
  Dependency.authorizationInterceptor = AuthorizationInterceptor(storage: Dependency.storage);
  Dependency.dio.interceptors.add(Dependency.authorizationInterceptor);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
