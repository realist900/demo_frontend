import 'package:demo_front/api/cat_api.dart';
import 'package:demo_front/dependency.dart';
import 'package:demo_front/model/cat.dart';
import 'package:flutter/material.dart';

class CatInfoController extends ChangeNotifier {
  final CatApi catApi = Dependency.catApi;

  Cat? _cat;

  Cat? get cat => _cat;

  void loadCat(int id) async {
    try {
      _cat = await catApi.getCat(id);
    } catch (e) {
      _cat = null;
    }
    notifyListeners();
  }
}
