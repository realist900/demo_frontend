import 'package:demo_front/feature/edit_cat/edit_cat_controller.dart';
import 'package:demo_front/model/cat.dart';
import 'package:flutter/material.dart';

class EditCatScreen extends StatefulWidget {
  final Cat cat;
  const EditCatScreen({
    super.key,
    required this.cat,
  });

  @override
  State<EditCatScreen> createState() => _EditCatScreenState();
}

class _EditCatScreenState extends State<EditCatScreen> {
  late final EditCatController _editCatController;
  @override
  void initState() {
    super.initState();
    _editCatController = EditCatController(widget.cat);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              TextFormField(
                initialValue: widget.cat.breed,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
                onChanged: (value) => _editCatController.name = value,
              ),
              TextFormField(
                initialValue: widget.cat.picture,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Picture',
                ),
                onChanged: (value) => _editCatController.picture = value,
              ),
              ElevatedButton(
                onPressed: () async {
                  final navigator = Navigator.of(context);
                  final res = await _editCatController.updateCat();
                  if (res) {
                    navigator.pop(true);
                  }
                },
                child: const Text('Edit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
