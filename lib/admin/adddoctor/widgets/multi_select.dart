import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../db_functions/crud.dart';

class MultiSelect extends StatelessWidget {
  final List<String> items;
  const MultiSelect({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Time'),
      content: SingleChildScrollView(
        child: ListBody(
          children: items
              .map(
                (item) => CheckboxListTile(
                  value: context.watch<Crud>().selectedItems.contains(item),
                  title: Text(item),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (ischecked) =>
                      context.read<Crud>().itemChange(item, ischecked!),
                ),
              )
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            context.read<Crud>().selectedItems;
            log(context.read<Crud>().selectedItems.toString());
            Navigator.pop(context);
          },
          child: const Text('Submit'),
        )
      ],
    );
  }
}
