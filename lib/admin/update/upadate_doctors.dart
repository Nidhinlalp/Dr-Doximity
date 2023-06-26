import 'package:dr_doximity/admin/update/widgets/contsultingfee.dart';
import 'package:dr_doximity/admin/update/widgets/dr_id_textfeild.dart';
import 'package:dr_doximity/admin/update/widgets/email_textformfeild.dart';
import 'package:dr_doximity/admin/update/widgets/experiance_textfeild.dart';
import 'package:dr_doximity/admin/update/widgets/explanation_textfeild.dart';
import 'package:dr_doximity/admin/update/widgets/hospital_textformfeild.dart';
import 'package:dr_doximity/admin/update/widgets/location_textformfeild.dart';
import 'package:dr_doximity/admin/update/widgets/name_texfeild.dart';
import 'package:dr_doximity/admin/update/widgets/patiance_textfeild.dart';
import 'package:dr_doximity/admin/update/widgets/update_button.dart';
import 'package:dr_doximity/admin/update/widgets/update_drphoto.dart';
import 'package:dr_doximity/admin/update/widgets/update_time.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../db_functions/crud.dart';

class UpDateDoctor extends StatelessWidget {
  UpDateDoctor({
    super.key,
    required this.name,
    required this.department,
    required this.hospital,
    required this.location,
    required this.explanation,
    required this.experience,
    required this.patience,
    required this.drid,
    required this.id,
    required this.profilePhoto,
    required this.selectedTimes,
    required this.consaltaionFee,
  }) {
    doctorName.text = name;
    doctorDepartment.text = department;
    doctorHospital.text = hospital;
    doctorLocation.text = location;
    doctorExplanation.text = explanation;
    doctorExperiance.text = experience;
    doctorPatiance.text = patience;
    doctorDrId.text = drid;
  }
  final String id;
  final String name;
  final String department;
  final String hospital;
  final String location;
  final String explanation;
  final String experience;
  final String patience;
  final String drid;
  final String profilePhoto;
  final List selectedTimes;
  final String consaltaionFee;

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
    context.read<Crud>().selectedItems =
        selectedTimes.map((e) => e.toString()).toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: const Text('Update'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [UpadatDoctorPhoto(profilePhoto: profilePhoto)],
              ),
              const SizedBox(
                height: 50,
              ),
              UpdateNameTextFormFeild(doctorName: doctorName),
              const SizedBox(
                height: 30,
              ),
              /*Department---------------------------------------------------------------------------------------- */
              UpdateEmailTextFormFeild(doctorDepartment: doctorDepartment),
              const SizedBox(
                height: 30,
              ),
              /*Hospital---------------------------------------------------------------------------------------- */
              UpdateHospitalTextFormFeild(doctorHospital: doctorHospital),
              const SizedBox(
                height: 30,
              ),
              /*location---------------------------------------------------------------------------------------- */
              UpdateLocationTextFormFeild(doctorLocation: doctorLocation),
              const SizedBox(
                height: 30,
              ),
              /*Explanation---------------------------------------------------------------------------------------- */
              UpdateExplanationTextFormFeild(
                doctorExplanation: doctorExplanation,
              ),
              const SizedBox(
                height: 30,
              ),
              //consultationfee---------------------------------------------------------------------------------------------
              const UpdateDrconsultationFeeTextFormFeild(),
              const SizedBox(
                height: 30,
              ),
              /*Experiance---------------------------------------------------------------------------------------- */
              UpdateExperianceTextFormFeild(doctorExperiance: doctorExperiance),
              const SizedBox(
                height: 30,
              ),
              /*Patians---------------------------------------------------------------------------------------- */

              UpdatePatianceTextFormFeild(doctorPatiance: doctorPatiance),
              const SizedBox(
                height: 30,
              ),
              /*Dr.id---------------------------------------------------------------------------------------- */

              UpdateDrIdTextFormFeild(doctorDrId: doctorDrId),
              const SizedBox(
                height: 50,
              ),
              //-----Time---------------------------------------------------------------------------
              const UpdateTime(),
              const SizedBox(
                height: 50,
              ),
              //----UpadateButton---------------------------------------------------------------------
              UpdateButton(id: id),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
