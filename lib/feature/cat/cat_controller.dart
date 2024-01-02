import 'dart:ffi';

import 'package:demo_front/api/cat_api.dart';
import 'package:demo_front/data/web_socket_repository.dart';
import 'package:demo_front/dependency.dart';
import 'package:demo_front/model/cat.dart';
import 'package:demo_front/model/event/remove_cat_event.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class CatController extends ChangeNotifier {
  final CatApi catApi = Dependency.catApi;
  final WebSocketRepository webSocketRepository = Dependency.webSocketRepository;
  List<Cat> _cats = [];
  var eol = false;

  List<Cat> get cats => _cats;
  int page = 0;
  int size = 20;
  bool _isLoading = false;

  void init() async {
    await webSocketRepository.connect();
    webSocketRepository.refreshStream.whereType<RemoveCatEvent>().listen((event) {});
  }

  void loadItems() async {
    if (_isLoading || eol) return;
    _isLoading = true;
    try {
      var data = (await catApi.getCats(
        limit: 1,
        offset: 2,
      ));
      _cats.addAll(data.values);
      eol = _cats.length >= data.total;
      // if (_cats.length > (page + 1) * size) {
      //   page++;
      // }
    } catch (e) {
      _cats = [];
    }
    _isLoading = false;
    notifyListeners();
  }

  void deleteCat(Cat cat) async {
    try {
      await catApi.deleteCat(cat.id);
      loadItems();
    } catch (e) {
      print(e);
    }
  }

  void close() {
    webSocketRepository.close();
  }
}
