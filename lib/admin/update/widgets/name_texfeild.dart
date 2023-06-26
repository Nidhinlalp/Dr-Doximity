import 'package:flutter/material.dart';

class UpdateNameTextFormFeild extends StatelessWidget {
  const UpdateNameTextFormFeild({
    super.key,
    required this.doctorName,
  });

  final TextEditingController doctorName;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: doctorName,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 17.0, horizontal: 20.0),
        filled: true,
        fillColor: Colors.grey,
        hintText: 'Name..',
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
