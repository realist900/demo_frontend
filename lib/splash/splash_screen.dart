import 'package:demo_front/dependency.dart';
import 'package:demo_front/feature/cat/cat_screen.dart';
import 'package:demo_front/feature/login/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    late Widget screen;
    if (Dependency.storage.accessToken != null && Dependency.storage.accessToken!.isNotEmpty) {
      screen = const CatScreen();
    } else {
      screen = const LoginScreen();
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => screen));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
