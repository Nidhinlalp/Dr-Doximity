import 'package:flutter/material.dart';

class UpdatePatianceTextFormFeild extends StatelessWidget {
  const UpdatePatianceTextFormFeild({
    super.key,
    required this.doctorPatiance,
  });

  final TextEditingController doctorPatiance;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: doctorPatiance,
      textInputAction: TextInputAction.done,
      //    controller: emailController,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 17.0, horizontal: 20.0),
        filled: true,
        fillColor: Colors.grey,
        //labelText: 'Email..',
        hintText: 'Patiance..',
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(17),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 3,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(17),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 3,
          ),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
