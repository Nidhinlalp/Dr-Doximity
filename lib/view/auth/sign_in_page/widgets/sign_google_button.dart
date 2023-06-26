import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignGoogleButton extends StatelessWidget {
  const SignGoogleButton({
    super.key,
    required this.onPressed,
  });
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        HapticFeedback.vibrate();
        onPressed();
      },
      child: Container(
        height: 56,
        width: 160,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(17),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(10, 20),
              blurRadius: 30,
            ),
          ],
        ),
        child: Center(
          child: Image.asset('assets/icons/Google.png'),
        ),
      ),
    );
  }
}
