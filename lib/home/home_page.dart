import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../admin/update/upadate_doctors.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final CollectionReference doctors =
      FirebaseFirestore.instance.collection('doctors');

  @override
  Widget build(BuildContext context) {
    QueryDocumentSnapshot<Object?>? doctosrsnap;
    return Scaffold(
      //Drawer
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.edit),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UpDateDoctor(
                consaltaionFee: doctosrsnap!['consaltaionFee'],
                name: doctosrsnap!['name'],
                department: doctosrsnap!['department'],
                drid: doctosrsnap!['drid'],
                experience: doctosrsnap!['experience'],
                explanation: doctosrsnap!['explanation'],
                hospital: doctosrsnap!['hospital'],
                location: doctosrsnap!['location'],
                patience: doctosrsnap!['patience'],
                profilePhoto: doctosrsnap!['profilePic'],
                selectedTimes: doctosrsnap!['times'],
                id: doctosrsnap!.id,
              ),
            ),
          );
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Accont'),
        backgroundColor: Colors.grey,
      ),

      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
        child: StreamBuilder(
          stream: doctors.orderBy('name').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.black,
                ),
              );
            } else if (snapshot.hasData) {
              log(snapshot.data!.docs.length.toString());
              var dataList = snapshot.data!.docs
                  .where((element) =>
                      element.id == FirebaseAuth.instance.currentUser!.uid)
                  .toList();

              return ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  doctosrsnap = dataList[index];
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                              doctosrsnap!['profilePic'],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          children: [
                            DoctorData(
                              data: doctosrsnap!['name'].toString(),
                              icon: Icons.person,
                            ),
                            DoctorData(
                              data: doctosrsnap!['department'].toString(),
                              icon: Icons.local_fire_department,
                            ),
                            DoctorData(
                              data: doctosrsnap!['hospital'].toString(),
                              icon: Icons.local_hospital_outlined,
                            ),
                            DoctorData(
                              data: doctosrsnap!['location'].toString(),
                              icon: Icons.location_city,
                            ),
                            DoctorData(
                              data: doctosrsnap!['experience'].toString(),
                              icon: Icons.explore_rounded,
                            ),
                            DoctorData(
                              data: doctosrsnap!['patience'].toString(),
                              icon: Icons.numbers,
                            ),
                            DoctorData(
                              data: doctosrsnap!['drid'].toString(),
                              icon: Icons.insert_drive_file,
                            ),
                            DoctorData(
                              data: doctosrsnap!['times'].toString(),
                              icon: Icons.timeline,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            } else {
              return const Text('Network Lost');
            }
          },
        ),
      ),
    );
  }
}

class DoctorData extends StatelessWidget {
  const DoctorData({
    super.key,
    required this.data,
    required this.icon,
  });
  final IconData icon;
  final String data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(data),
    );
  }
}
