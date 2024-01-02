import 'package:demo_front/model/cat.dart';
import 'package:flutter/material.dart';

class CatListItem extends StatelessWidget {
  final Cat cat;
  final ValueChanged<Cat> onTap;
  final ValueChanged<Cat> onTapDelete;
  final ValueChanged<Cat> onTapEdit;

  const CatListItem({
    super.key,
    required this.cat,
    required this.onTap,
    required this.onTapDelete,
    required this.onTapEdit,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onTap(cat),
        child: SizedBox(
          height: 48,
          child: Row(
            children: [
              const SizedBox(width: 8),
              Container(
                width: 24,
                height: 24,
                color: Colors.deepOrangeAccent,
              ),
              const SizedBox(width: 8),
              Text(
                '${cat.breed} ${cat.id}',
              ),
              const Spacer(),
              InkWell(
                onTap: () => onTapEdit(cat),
                child: const Icon(Icons.edit),
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: () => onTapDelete(cat),
                child: const Icon(Icons.delete),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
      );
}
