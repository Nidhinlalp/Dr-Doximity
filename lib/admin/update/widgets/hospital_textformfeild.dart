import 'package:flutter/material.dart';

class UpdateHospitalTextFormFeild extends StatelessWidget {
  const UpdateHospitalTextFormFeild({
    super.key,
    required this.doctorHospital,
  });

  final TextEditingController doctorHospital;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: doctorHospital,
      textInputAction: TextInputAction.done,
      //    controller: emailController,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 17.0, horizontal: 20.0),
        filled: true,
        fillColor: Colors.grey,
        //labelText: 'Email..',
        hintText: 'Hospital..',
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
