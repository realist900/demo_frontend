import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:demo_front/dependency.dart';
import 'package:demo_front/model/event/base_event.dart';
import 'package:demo_front/model/event/remove_cat_event.dart';

class WebSocketRepository {
  final refreshController = StreamController<BaseEvent>();

  late WebSocket channel;

  Stream<BaseEvent> get refreshStream => refreshController.stream;

  Future<void> connect() async {
    Map<String, dynamic> headers = {'Authorization': 'Bearer ${Dependency.storage.accessToken}'};

    channel = await WebSocket.connect(
      'ws://192.168.1.65:8080/websocket',
      headers: headers,
    );

    channel.listen(
      (data) {
        data as String;
        final message = json.decode(data);
        final String type = message['type'] as String;
        final dynamic payload = message['payload'];

        switch (type) {
          case 'removeCats':
            handleRemoveCat(payload);
        }
      },
    );
  }

  void handleRemoveCat(dynamic payload) {
    final catIds = (payload as List).map((e) => e as int).toList();
    refreshController.add(RemoveCatEvent(removedCatIds: catIds));
  }

  void close() {
    refreshController.close();
    channel.close();
  }
}
