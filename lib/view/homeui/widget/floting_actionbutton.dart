import 'package:flutter/material.dart';

import '../../../admin/adddoctor/admin.dart';

class HomeFotingActionbutton extends StatelessWidget {
  const HomeFotingActionbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [Colors.red, Colors.blue],
          ),
        ),
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AdminHomePage()),
        );
      },
    );
  }
}
