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
  final int _limit = 20;
  bool _isLoading = false;

  void init() async {
    await webSocketRepository.connect();
    webSocketRepository.refreshStream.whereType<RemoveCatEvent>().listen((event) {
      _cats.removeWhere((cat) => event.removedCatIds.contains(cat.id));
      notifyListeners();
    });
  }

  void loadInitial() async {
    try {
      var data = await catApi.getCats(
        limit: _limit,
        offset: _cats.length,
      );
      _cats.addAll(data.values);
      eol = _cats.length >= data.total;
    } catch (e) {
      _cats = [];
    }
    notifyListeners();
  }

  void loadMore() async {
    if (_isLoading || eol) return;
    _isLoading = true;
    try {
      var data = await catApi.getCats(
        limit: _limit,
        offset: _cats.length,
      );
      _cats.addAll(data.values);
      eol = _cats.length >= data.total;
    } catch (e) {
      _cats = [];
    }
    _isLoading = false;
    notifyListeners();
  }

  void deleteCat(Cat cat) async {
    try {
      await catApi.deleteCat(cat.id);
      loadInitial();
    } catch (e) {
      print(e);
    }
  }

  void close() {
    webSocketRepository.close();
  }
}
