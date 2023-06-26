import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../admin/update/upadate_doctors.dart';

class HomeEditAndDelete extends StatelessWidget {
  const HomeEditAndDelete({
    super.key,
    required this.doctosrsnap,
  });

  final QueryDocumentSnapshot<Object?> doctosrsnap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UpDateDoctor(
                  consaltaionFee: doctosrsnap['consaltaionFee'],
                  name: doctosrsnap['name'],
                  department: doctosrsnap['department'],
                  drid: doctosrsnap['drid'],
                  experience: doctosrsnap['experience'],
                  explanation: doctosrsnap['explanation'],
                  hospital: doctosrsnap['hospital'],
                  location: doctosrsnap['location'],
                  patience: doctosrsnap['patience'],
                  profilePhoto: doctosrsnap['profilePic'],
                  selectedTimes: doctosrsnap['times'],
                  id: doctosrsnap.id,
                ),
              ),
            );
          },
          icon: const Icon(
            Icons.edit,
          ),
        ),
        IconButton(
          onPressed: () {
            //context.read<Crud>().deleteDoctor(doctosrsnap.id);
          },
          icon: const Icon(
            Icons.delete_forever,
          ),
        )
      ],
    );
  }
}
