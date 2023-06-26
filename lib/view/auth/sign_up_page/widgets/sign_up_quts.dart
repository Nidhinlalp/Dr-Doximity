import 'package:flutter/material.dart';

class SignUpPageQuts extends StatelessWidget {
  const SignUpPageQuts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Join us to start searching',
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.w700, letterSpacing: 1),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your information is safe with us',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1)),
          ],
        ),
      ],
    );
  }
}
