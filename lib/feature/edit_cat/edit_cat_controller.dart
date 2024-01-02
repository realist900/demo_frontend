import 'package:demo_front/api/cat_api.dart';
import 'package:demo_front/dependency.dart';
import 'package:demo_front/model/cat.dart';
import 'package:flutter/material.dart';

class EditCatController extends ChangeNotifier {
  EditCatController(this.cat);
  final Cat cat;
  final CatApi catApi = Dependency.catApi;
  String name = '';
  String picture = '';

  Future<bool> updateCat() async {
    if (name.isEmpty) {
      return false;
    }
    try {
      await catApi.updateCat(
        cat.id,
        Cat(
          breed: name,
          picture: picture,
        ),
      );
    } catch (e) {
      print(e);
      return false;
    }

    return true;
  }
}
