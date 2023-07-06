import 'package:flutter/material.dart';

class DrDetails extends StatelessWidget {
  const DrDetails({
    super.key,
  });

  static TextEditingController doctorName = TextEditingController();
  static TextEditingController doctorDepartment = TextEditingController();
  static TextEditingController doctorHospital = TextEditingController();
  static TextEditingController doctorLocation = TextEditingController();
  static TextEditingController doctorExplanation = TextEditingController();
  static TextEditingController doctorExperiance = TextEditingController();
  static TextEditingController doctorPatiance = TextEditingController();
  static TextEditingController doctorDrId = TextEditingController();
  static TextEditingController consultationFee = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      /*Name---------------------------------------------------------------------------------------- */
      TextFormField(
        controller: doctorName,
        textInputAction: TextInputAction.done,
        //    controller: emailController,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 17.0, horizontal: 20.0),
          filled: true,
          fillColor: Colors.grey,
          //labelText: 'Email..',
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
      ),
      const SizedBox(
        height: 30,
      ),
      /*Department---------------------------------------------------------------------------------------- */
      TextFormField(
        controller: doctorDepartment,
        textInputAction: TextInputAction.done,
        //    controller: emailController,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 17.0, horizontal: 20.0),
          filled: true,
          fillColor: Colors.grey,
          //labelText: 'Email..',
          hintText: 'Department..',
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
      ),
      const SizedBox(
        height: 30,
      ),
      /*Hospital---------------------------------------------------------------------------------------- */
      TextFormField(
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
      ),
      const SizedBox(
        height: 30,
      ),
      /*location---------------------------------------------------------------------------------------- */
      TextFormField(
        controller: doctorLocation,
        textInputAction: TextInputAction.done,
        //    controller: emailController,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 17.0, horizontal: 20.0),
          filled: true,
          fillColor: Colors.grey,
          //labelText: 'Email..',
          hintText: 'Location..',
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
      ),
      const SizedBox(
        height: 30,
      ),
      /*Explanation---------------------------------------------------------------------------------------- */
      TextFormField(
        controller: doctorExplanation,
        textInputAction: TextInputAction.done,
        //    controller: emailController,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 17.0, horizontal: 20.0),
          filled: true,
          fillColor: Colors.grey,
          //labelText: 'Email..',
          hintText: 'Explanation..',
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
      ),
      //-conseltationfee-------------------------------
      const SizedBox(
        height: 30,
      ),
      TextFormField(
        controller: consultationFee,
        textInputAction: TextInputAction.done,
        //    controller: emailController,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 17.0, horizontal: 20.0),
          filled: true,
          fillColor: Colors.grey,
          hintText: 'Fee..',
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
      ),
      const SizedBox(
        height: 30,
      ),
      /*Experiance---------------------------------------------------------------------------------------- */
      TextFormField(
        controller: doctorExperiance,
        textInputAction: TextInputAction.done,
        //    controller: emailController,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 17.0, horizontal: 20.0),
          filled: true,
          fillColor: Colors.grey,
          //labelText: 'Email..',
          hintText: 'Experience..',
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
      ),
      const SizedBox(
        height: 30,
      ),
      /*Patians---------------------------------------------------------------------------------------- */

      TextFormField(
        controller: doctorPatiance,
        textInputAction: TextInputAction.done,
        //    controller: emailController,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 17.0, horizontal: 20.0),
          filled: true,
          fillColor: Colors.grey,
          //labelText: 'Email..',
          hintText: 'Patients..',
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
      ),
      const SizedBox(
        height: 30,
      ),
      /*Dr.id---------------------------------------------------------------------------------------- */

      TextFormField(
        controller: doctorDrId,
        textInputAction: TextInputAction.done,
        //    controller: emailController,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 17.0, horizontal: 20.0),
          filled: true,
          fillColor: Colors.grey,
          //labelText: 'Email..',
          hintText: 'Dr.id ..',
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
      ),
    ]);
  }
}
