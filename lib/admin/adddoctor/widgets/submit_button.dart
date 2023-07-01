import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../db_functions/crud.dart';
import '../../../view/home/home_screen.dart';

class SubmitBotton extends StatelessWidget {
  const SubmitBotton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Crud>(builder: (context, crud, _) {
      if (crud.isLoding) {
        return const CircularProgressIndicator();
      }
      return SizedBox(
        height: 50,
        width: 310,
        child: ElevatedButton(
          onPressed: () async {
            await context.read<Crud>().addDoctors();
            if (context.mounted) {
              context.read<Crud>().clear();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => HomePage(),
                ),
                (route) => false,
              );
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
          child: const Text('Requst to Addmin '),
        ),
      );
    });
  }
}
