import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../db_functions/crud.dart';

class UpdateButton extends StatelessWidget {
  const UpdateButton({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return Consumer<Crud>(
      builder: (BuildContext context, value, _) {
        if (value.isLoding) {
          return const CircularProgressIndicator();
        }
        return SizedBox(
          height: 50,
          width: 310,
          child: ElevatedButton(
            onPressed: () async {
              await context.read<Crud>().updateDoctorDetails(id);
              if (context.mounted) {
                context.read<Crud>().clear();
                Navigator.pop(context);
              }
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
              ),
              overlayColor: MaterialStateProperty.all(Colors.black),
              backgroundColor: MaterialStateProperty.all(Colors.green),
            ),
            child: context.watch<Crud>().isLodingUpdate
                ? const CircularProgressIndicator()
                : const Text('Update'),
          ),
        );
      },
    );
  }
}
