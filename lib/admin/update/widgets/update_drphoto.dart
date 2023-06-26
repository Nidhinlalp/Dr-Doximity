import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../db_functions/crud.dart';

class UpadatDoctorPhoto extends StatelessWidget {
  const UpadatDoctorPhoto({
    super.key,
    required this.profilePhoto,
  });

  final String profilePhoto;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          height: 150,
          width: 150,
          decoration: const BoxDecoration(
            color: Colors.black45,
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
          child: context.watch<Crud>().file == null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    profilePhoto,
                    fit: BoxFit.cover,
                  ),
                )
              : Image.file(
                  context.watch<Crud>().file!,
                  fit: BoxFit.cover,
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
    );
  }
}
