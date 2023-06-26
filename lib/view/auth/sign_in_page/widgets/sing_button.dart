import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SingInButton extends StatelessWidget {
  const SingInButton(
      {super.key,
      required this.name,
      required this.onPressed,
      required this.formKey});
  final void Function() onPressed;
  final String name;

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 310,
      child: ElevatedButton(
        onPressed: () {
          HapticFeedback.heavyImpact();
          if (formKey.currentState!.validate()) {
            onPressed();
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
        child: Text(
          name,
          style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
