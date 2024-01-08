import 'dart:async';

import 'package:demo_front/api/request/add_fcm_token_request.dart';
import 'package:demo_front/dependency.dart';
import 'package:demo_front/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

abstract class FirebaseMessagingState<T extends StatefulWidget> extends State<T> {
  late StreamSubscription<String> _tokenStreamSubscription;
  late StreamSubscription<Map<String, dynamic>> _localNotificationStreamSubscription;
  late final Stream<Map<String, dynamic>> localNotificationSelectStream;

  void _setToken(String? token) async {
    if (Dependency.storage.accessToken != null && token != null) {
      try {
        Dependency.cloudMessagingApi.addFcmToken(
          AddFcmTokenRequest(
            token: token,
            deviceId: await Dependency.deviceInfo.deviceId(),
          ),
        );
      } catch (e) {
        print(e);
      }
    }
  }

  void requestToken() => FirebaseMessaging.instance.getToken().then(_setToken);

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance.requestPermission();
    _tokenStreamSubscription = FirebaseMessaging.instance.onTokenRefresh.listen(_setToken);

    FirebaseMessaging.onMessage.listen(showLocalNotification);

    FirebaseMessaging.instance.getInitialMessage().then(
      (value) {
        if (value != null && value.data.isNotEmpty) {}
      },
    );

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) => _onNotificationPressed(message.data));

    _localNotificationStreamSubscription = localNotificationSelectStream.listen((data) => _onNotificationPressed(data));
  }

  void _onNotificationPressed(Map<String, dynamic> data) {
    if (!data.containsKey('type')) return;
  }

  @override
  void dispose() {
    super.dispose();
    _tokenStreamSubscription.cancel();
    _localNotificationStreamSubscription.cancel();
  }
}
