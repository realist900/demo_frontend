import 'dart:io';

import 'package:demo_front/dependency.dart';
import 'package:demo_front/feature/add_cat/add_cat_screen.dart';
import 'package:demo_front/feature/cat/cat_controller.dart';
import 'package:demo_front/feature/cat_info/cat_info_screen.dart';
import 'package:demo_front/cat_list_item.dart';
import 'package:demo_front/feature/edit_cat/edit_cat_screen.dart';
import 'package:demo_front/feature/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class CatScreen extends StatefulWidget {
  const CatScreen({super.key});

  @override
  State<CatScreen> createState() => _CatScreenState();
}

class _CatScreenState extends State<CatScreen> {
  final CatController _catController = CatController();

  final scrollController = ScrollController();

  late final WebSocket channel;

  @override
  void initState() {
    super.initState();
    _catController.init();
    _catController.addListener(() => WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          setState(() {});
        }));
    _catController.loadItems();
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        _catController.loadItems();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cats'),
          actions: [
            IconButton(
              onPressed: () async {
                final navigator = Navigator.of(context);
                navigator.push(MaterialPageRoute(builder: (_) => const ProfileScreen()));
              },
              icon: const Icon(Icons.account_circle),
            ),
            IconButton(
              onPressed: () async {
                channel.add('Hello, Dart!');
              },
              icon: const Icon(Icons.send),
            ),
          ],
        ),
        body: ListView.separated(
          controller: scrollController,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            return CatListItem(
              cat: _catController.cats[index],
              onTap: (cat) {
                Navigator.of(context).push<bool>(MaterialPageRoute(builder: (_) => CatInfoScreen(catId: cat.id)));
              },
              onTapEdit: (cat) async {
                final navigator = Navigator.of(context);
                final bool? res =
                    await navigator.push<bool>(MaterialPageRoute(builder: (_) => EditCatScreen(cat: cat)));
                if (res ?? false) {
                  _catController.loadItems();
                }
              },
              onTapDelete: (cat) {
                _catController.deleteCat(cat);
              },
            );
          },
          itemCount: _catController.cats.length,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final res = await Navigator.of(context).push<bool>(MaterialPageRoute(builder: (_) => const AddCatScreen()));
            if (res ?? false) {
              _catController.loadItems();
            }
          },
          child: const Icon(Icons.add),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _catController.close();
  }
}
