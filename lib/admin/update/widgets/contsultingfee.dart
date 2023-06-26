import 'package:flutter/material.dart';

class UpdateDrconsultationFeeTextFormFeild extends StatelessWidget {
  const UpdateDrconsultationFeeTextFormFeild({
    super.key,
  });

  static TextEditingController consultingFee = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: consultingFee,
      textInputAction: TextInputAction.done,
      //    controller: emailController,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 17.0, horizontal: 20.0),
        filled: true,
        fillColor: Colors.grey,
        //labelText: 'Email..',
        hintText: 'Dr.Fee ..',
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
      keyboardType: TextInputType.number,
    );
  }
}
