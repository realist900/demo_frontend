import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:demo_front/api/common/authorization_interceptor.dart';
import 'package:demo_front/dependency.dart';
import 'package:demo_front/feature/app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyA-NR3VS9RT3LDSl9DgG8nTf0xIiwbT884',
    appId: '1:320636366568:android:f7ffd547454f1e5a5d235d',
    messagingSenderId: '320636366568',
    projectId: 'demoapp-18126',
  ));
  final StreamController<Map<String, dynamic>> localNotificationSelectController = StreamController();
  await _setupLocalNotifications(localNotificationSelectController);

  Dependency.storage = Storage(sharedPreferences: await SharedPreferences.getInstance());
  Dependency.authorizationInterceptor = AuthorizationInterceptor(storage: Dependency.storage);
  Dependency.dio.interceptors.add(Dependency.authorizationInterceptor);
  runApp(
    MyApp(
      localNotificationSelectStream: localNotificationSelectController.stream,
    ),
  );
}

late AndroidNotificationChannel channel;

late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

bool isFlutterLocalNotificationsInitialized = false;

void showLocalNotification(RemoteMessage message) {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  if (notification != null && android != null && !kIsWeb) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          'channel.id',
          channel.name,
          channelDescription: channel.description,
          icon: 'ic_launcher',
        ),
      ),
      payload: jsonEncode(message.data),
    );
  }
}

Future<void> _setupLocalNotifications(StreamController<Map<String, dynamic>> controller) async {
  channel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.high,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  if (Platform.isAndroid) {
    await flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(android: AndroidInitializationSettings('ic_launcher')),
      onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) async {
        if (notificationResponse.notificationResponseType == NotificationResponseType.selectedNotification &&
            notificationResponse.payload != null) {
          final Map<String, dynamic> data = jsonDecode(notificationResponse.payload!) as Map<String, dynamic>;
          controller.add(data);
        }
      },
    );
  }

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  isFlutterLocalNotificationsInitialized = true;
}
