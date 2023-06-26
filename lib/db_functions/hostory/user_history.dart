import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class UserHistory with ChangeNotifier {
  bool isloding = false;
  addHistory(DateTime? date, String time, String patientUid) async {
    isloding = true;
    final doctor = await FirebaseFirestore.instance
        .collection('doctors')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    final history = FirebaseFirestore.instance.collection('history');

    final historyData = {
      'money': doctor.data()!['consaltaionFee'],
      'drName': doctor.data()!['name'] ?? 'Dr...',
      'time': time,
      'date': date
    };
    var f = await history.doc(patientUid).get();
    final historyRef = history.doc(patientUid);
    if (f.exists) {
      historyRef.update(
        {
          'history': FieldValue.arrayUnion([historyData])
        },
      );
    } else {
      historyRef.set(
        {
          'history': FieldValue.arrayUnion([historyData])
        },
      );
    }

    isloding = false;
  }
}
