import 'package:flutter/material.dart';

class SignInOrSection extends StatelessWidget {
  const SignInOrSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Flexible(
          child: Divider(
            height: 30.0,
            thickness: 2.0,
            color: Colors.black,
            indent: 20.0,
            endIndent: 20.0,
          ),
        ),
        Text(
          'OR',
          style: TextStyle(
              fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w500),
        ),
        Flexible(
          child: Divider(
            height: 30.0,
            thickness: 2.0,
            color: Colors.black,
            indent: 20.0,
            endIndent: 20.0,
          ),
        ),
      ],
    );
  }
}
