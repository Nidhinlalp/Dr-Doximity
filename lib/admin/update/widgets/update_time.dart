import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../db_functions/crud.dart';

class UpdateTime extends StatelessWidget {
  const UpdateTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            context.read<Crud>().showMultilSelect(context);
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(17),
              ),
            ),
            overlayColor: MaterialStateProperty.all(Colors.black),
            backgroundColor: MaterialStateProperty.all(Colors.black87),
          ),
          child: const Text('Select TimeSlot'),
        ),
        Wrap(
          children: context
              .watch<Crud>()
              .selectedItems
              .map(
                (e) => Chip(
                  label: Text(e),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
