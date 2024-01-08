import 'dart:async';

import 'package:demo_front/feature/firebase_messaging_state.dart';
import 'package:demo_front/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  final Stream<Map<String, dynamic>> localNotificationSelectStream;

  const MyApp({
    super.key,
    required this.localNotificationSelectStream,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends FirebaseMessagingState<MyApp> {
  @override
  void initState() {
    localNotificationSelectStream = widget.localNotificationSelectStream;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (notification) {
        if (notification is RequestFirebaseTokenNotification) {
          requestToken();
          return true;
        }
        return false;
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

class RequestFirebaseTokenNotification extends Notification {}
