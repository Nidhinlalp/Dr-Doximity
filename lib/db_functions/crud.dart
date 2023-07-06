import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../admin/adddoctor/widgets/dr_details.dart';
import '../admin/adddoctor/widgets/multi_select.dart';
import '../admin/update/upadate_doctors.dart';
import '../admin/update/widgets/contsultingfee.dart';
import 'auth/auth.dart';

class Crud with ChangeNotifier {
  final CollectionReference doctors =
      FirebaseFirestore.instance.collection('doctors');
  List<String> selectTimes = [];
  List<String> selectedItems = [];

  File? file;
  bool isLoding = false;
  bool isLodingUpdate = false;
  String? pickedFile;
  void pickFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      file = File(result.files.single.path ?? "");
      pickedFile = result.names.first;
      notifyListeners();
    }
  }

  Future<String?> uploadFile(String doctorID) async {
    if (file == null) {
      return null;
    }
    final path = 'files/$doctorID.jpeg';
    final ref = FirebaseStorage.instance.ref().child(path);

    var uploadTask = await ref.putFile(file!);
    notifyListeners();
    return await uploadTask.ref.getDownloadURL();
  }

  Future<bool> addDoctors() async {
    isLoding = true;
    notifyListeners();
    log('etheoooo1111111111');
    var docRef = doctors.doc(FirebaseAuth.instance.currentUser!.uid);
    log('etheoooo2222222');
    String? profilePicUrl = await uploadFile(docRef.id);
    log('etheoooo333');
    if (profilePicUrl == null) {
      return false;
    }
    final data = {
      'name': DrDetails.doctorName.text,
      'department': DrDetails.doctorDepartment.text,
      'hospital': DrDetails.doctorHospital.text,
      'location': DrDetails.doctorLocation.text,
      'explanation': DrDetails.doctorExplanation.text,
      'experience': DrDetails.doctorExperiance.text,
      'patience': DrDetails.doctorPatiance.text,
      'drid': DrDetails.doctorDrId.text,
      'profilePic': profilePicUrl,
      'times': selectedItems,
      'consaltaionFee': DrDetails.consultationFee.text,
      'requst': false,
      'drUid': FirebaseAuth.instance.currentUser!.uid
    };

    docRef.set(data);
    log('etheoooo4');
    isLoding = false;
    notifyListeners();
    return true;
  }

  void deleteDoctor(docid, BuildContext context) async {
    var docRef = await doctors.doc(docid).get()
        as DocumentSnapshot<Map<String, dynamic>>;
    String picUrl = docRef.data()!['profilePic'];
    doctors.doc(docid).delete();
    FirebaseStorage.instance
        .refFromURL(picUrl)
        .delete()
        .then((value) => context.read<AuthProvider>().signOut(context));
    notifyListeners();
  }

  Future<void> updateDoctorDetails(docId) async {
    isLodingUpdate = true;
    notifyListeners();
    var docRef = doctors.doc();
    String? profilePicUrl = await uploadFile(docRef.id);
    final Map<String, dynamic> data;
    if (profilePicUrl == null) {
      data = {
        'name': UpDateDoctor.doctorName.text,
        'department': UpDateDoctor.doctorDepartment.text,
        'hospital': UpDateDoctor.doctorHospital.text,
        'location': UpDateDoctor.doctorLocation.text,
        'explanation': UpDateDoctor.doctorExplanation.text,
        'experience': UpDateDoctor.doctorExperiance.text,
        'patience': UpDateDoctor.doctorPatiance.text,
        'drid': UpDateDoctor.doctorDrId.text,
        'times': selectedItems,
        'consaltaionFee':
            UpdateDrconsultationFeeTextFormFeild.consultingFee.text,
      };
    } else {
      data = {
        'name': UpDateDoctor.doctorName.text,
        'department': UpDateDoctor.doctorDepartment.text,
        'hospital': UpDateDoctor.doctorHospital.text,
        'location': UpDateDoctor.doctorLocation.text,
        'explanation': UpDateDoctor.doctorExplanation.text,
        'experience': UpDateDoctor.doctorExperiance.text,
        'patience': UpDateDoctor.doctorPatiance.text,
        'drid': UpDateDoctor.doctorDrId.text,
        'profilePic': profilePicUrl,
        'times': selectedItems,
        'consaltaionFee':
            UpdateDrconsultationFeeTextFormFeild.consultingFee.text,
      };
    }
    doctors.doc(docId).update(data);
    isLodingUpdate = false;
    notifyListeners();
  }

  void showMultilSelect(BuildContext context) async {
    final List<String> items = [
      '9:00 AM',
      '10:00 AM',
      '11:00 AM',
      '12:00 PM',
      '1:00 PM',
      '2:00 PM',
      '3:00 PM',
      '4:00 PM',
      '5:00 PM',
      '6:00 PM'
    ];
    final List<String>? result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: items);
      },
    );

    if (result != null) {
      selectTimes = result;
      notifyListeners();
    }
  }

  void itemChange(String itemValue, bool isSelected) {
    if (isSelected) {
      selectedItems.add(itemValue);
      notifyListeners();
    } else {
      selectedItems.remove(itemValue);
      notifyListeners();
    }
  }

  clear() {
    file = null;
    DrDetails.doctorName.clear();
    DrDetails.doctorDepartment.clear();
    DrDetails.doctorHospital.clear();
    DrDetails.doctorLocation.clear();
    DrDetails.doctorExplanation.clear();
    DrDetails.doctorExperiance.clear();
    DrDetails.doctorPatiance.clear();
    DrDetails.doctorDrId.clear();
    DrDetails.consultationFee.clear();
    selectedItems.clear();
    notifyListeners();
  }
}
