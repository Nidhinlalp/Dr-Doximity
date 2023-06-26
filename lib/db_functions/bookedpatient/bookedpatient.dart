import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../model/booking.dart';

final CollectionReference allBookedPatientDeteils = FirebaseFirestore.instance
    .collection('doctors')
    .doc(FirebaseAuth.instance.currentUser!.uid)
    .collection('patientLisernDr');

Stream<List<BookingPatient>> getAllBookedPatientStream() {
  return allBookedPatientDeteils.snapshots().map((snapshot) {
    return snapshot.docs.map((doc) {
      log('hasdata${doc.data()}');
      return BookingPatient.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();
  });
}
