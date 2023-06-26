import 'package:dr_doximity/admin/adddoctor/widgets/add_time.dart';
import 'package:dr_doximity/admin/adddoctor/widgets/dr_details.dart';
import 'package:dr_doximity/admin/adddoctor/widgets/photo_add_section.dart';
import 'package:dr_doximity/admin/adddoctor/widgets/submit_button.dart';
import 'package:flutter/material.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({
    super.key,
  });

  // void showMultilSelect() async {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              PhotoAdd(),
              SizedBox(
                height: 50,
              ),
              DrDetails(),
              SizedBox(
                height: 50,
              ),
              TimeAddSection(),
              SizedBox(
                height: 50,
              ),
              SubmitBotton(),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
