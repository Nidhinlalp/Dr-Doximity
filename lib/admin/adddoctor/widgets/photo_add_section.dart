import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../db_functions/crud.dart';

class PhotoAdd extends StatelessWidget {
  const PhotoAdd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            InkWell(
              onTap: () {
                context.read<Crud>().pickFile();
              },
              child: Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: context.watch<Crud>().file != null
                    ? Image.file(
                        context.watch<Crud>().file!,
                        fit: BoxFit.cover,
                      )
                    : const Center(
                        child: Text('select image'),
                      ),
              ),
            ),
            IconButton(
              onPressed: () {
                context.read<Crud>().pickFile();
              },
              icon: const Icon(
                Icons.add_a_photo,
              ),
            ),
          ],
        )
      ],
    );
  }
}
