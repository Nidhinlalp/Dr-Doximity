import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../model/booking.dart';

class Accepting with ChangeNotifier {
  var doctors = FirebaseFirestore.instance.collection('doctors');
  void accrpted(BookingPatient data) async {
    final acepted = {
      'acept': true,
      'decline': false,
    };
    final ref = FirebaseFirestore.instance
        .collection('doctors')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('patientLisernDr')
        .doc(data.userUid);
    final refP = FirebaseFirestore.instance
        .collection('doctors')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('patient')
        .doc(data.userUid);

    ref.update(acepted);
    refP.update(acepted);
  }

  void decline(BookingPatient data) {
    final canceld = {
      'acept': false,
      'decline': true,
    };
    final ref = FirebaseFirestore.instance
        .collection('doctors')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('patientLisernDr')
        .doc(data.userUid);
    final reP = FirebaseFirestore.instance
        .collection('doctors')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('patient')
        .doc(data.userUid);
    ref.update(canceld);
    reP.update(canceld);
  }

  void completed(BookingPatient data) {
    final completed = {
      'completed': true,
    };
    final ref = FirebaseFirestore.instance
        .collection('doctors')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('patientLisernDr')
        .doc(data.userUid);
    final refP = FirebaseFirestore.instance
        .collection('doctors')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('patient')
        .doc(data.userUid);
    ref.update(completed);
    refP.update(completed);
  }

  clearData(userId) async {
    var pRef = doctors
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("patientLisernDr")
        .doc(userId);

    await pRef.delete();
  }
}
