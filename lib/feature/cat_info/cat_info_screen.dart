import 'package:demo_front/feature/cat_info/cat_info_controller.dart';
import 'package:flutter/material.dart';

class CatInfoScreen extends StatefulWidget {
  final int catId;

  const CatInfoScreen({
    super.key,
    required this.catId,
  });

  @override
  State<CatInfoScreen> createState() => _CatInfoScreenState();
}

class _CatInfoScreenState extends State<CatInfoScreen> {
  final CatInfoController _catInfoController = CatInfoController();

  @override
  void initState() {
    super.initState();
    _catInfoController.addListener(() => setState(() {}));
    _catInfoController.loadCat(widget.catId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: _catInfoController.cat != null
              ? Column(
                  children: [
                    Text(
                      _catInfoController.cat!.breed,
                    ),
                    Text(
                      _catInfoController.cat!.picture,
                    ),
                  ],
                )
              : const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
