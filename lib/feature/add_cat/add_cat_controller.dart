import 'package:demo_front/api/cat_api.dart';
import 'package:demo_front/dependency.dart';
import 'package:demo_front/model/cat.dart';
import 'package:flutter/material.dart';

class AddCatController extends ChangeNotifier {
  final CatApi catApi = Dependency.catApi;
  String name = '';
  String picture = '';

  Future<bool> saveCat() async {
    if (name.isEmpty) {
      return false;
    }
    try {
      await catApi.addCat(
        Cat(
          breed: name,
          picture: picture,
          created: DateTime.now().toUtc().toIso8601String(),
        ),
      );
    } catch (e) {
      print(e);
      return false;
    }

    return true;
  }
}
