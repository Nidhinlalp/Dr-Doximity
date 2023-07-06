import 'dart:developer';
import 'package:dr_doximity/view/bokked/widget/comon_hedline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../db_functions/accepted/accepting.dart';
import '../../db_functions/auth/auth.dart';
import '../../db_functions/bookedpatient/bookedpatient.dart';
import '../../db_functions/hostory/user_history.dart';
import '../../home/home_page.dart';

class BookingNotification extends StatefulWidget {
  const BookingNotification({super.key});

  @override
  State<BookingNotification> createState() => _BookingNotificationState();
}

class _BookingNotificationState extends State<BookingNotification> {
  bool _isVisible = true;

  final List<String> monthList = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "Mey",
    "Jun",
    "July",
    "Aug",
    "Spt",
    "Oct",
    "Nuv",
    "Dec"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.grey),
                accountName: Text(
                  "",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("W E L C O M E  TO  D O X I M I T Y"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 165, 255, 137),
                  child: Icon(Icons.person),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text(' Terms And Conditions '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: const Text(' Privacy Plicy '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                context.read<AuthProvider>().signOut(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
        backgroundColor: Colors.grey,
      ),
      backgroundColor: Colors.grey[300],
      body: StreamBuilder(
        stream: getAllBookedPatientStream(),
        builder: (context, snapshot) {
          log(snapshot.data.toString());
          if (snapshot.connectionState == ConnectionState.waiting) {
            return getShimmerLoading();
          } else if (snapshot.hasData) {
            return snapshot.data!.isEmpty
                ? const Center(
                    child: Text('No Notifictions'),
                  )
                : ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final data = snapshot.data![index];
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Visibility(
                              visible: _isVisible,
                              child: Container(
                                height: 310,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      ComonHedlineWidget(
                                        content: data.name,
                                        head: 'Patient',
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ComonHedlineWidget(
                                        content: data.age,
                                        head: "Age",
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ComonHedlineWidget(
                                        content: data.phone,
                                        head: 'Phone',
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ComonHedlineWidget(
                                        content:
                                            '${data.date!.day.toString()} - ${monthList[data.date!.month - 1].toString()} - ${data.date!.year.toString()}',
                                        head: 'Date',
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ComonHedlineWidget(
                                        content: data.time,
                                        head: 'Time',
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ComonHedlineWidget(
                                        content: data.descrption,
                                        head: 'Descrption',
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      data.acept == true
                                          ? data.completed == true
                                              ? SizedBox(
                                                  width: double.infinity,
                                                  child: OutlinedButton(
                                                    onPressed: () {
                                                      context
                                                          .read<Accepting>()
                                                          .clearData(
                                                              data.userUid);
                                                    },
                                                    child: const Text('Clear'),
                                                  ),
                                                )
                                              : Row(
                                                  children: [
                                                    Expanded(
                                                      child: ElevatedButton(
                                                        onPressed: () async {
                                                          await context
                                                              .read<
                                                                  UserHistory>()
                                                              .addHistory(
                                                                data.date,
                                                                data.time,
                                                                data.userUid,
                                                              );
                                                          if (context.mounted) {
                                                            context
                                                                .read<
                                                                    Accepting>()
                                                                .completed(
                                                                    data);
                                                          }
                                                        },
                                                        child: context
                                                                    .watch<
                                                                        UserHistory>()
                                                                    .isloding ==
                                                                true
                                                            ? const CupertinoActivityIndicator()
                                                            : const Text(
                                                                'Complete ?',
                                                              ),
                                                      ),
                                                    )
                                                  ],
                                                )
                                          : data.decline == true
                                              ? SizedBox(
                                                  width: double.infinity,
                                                  child: OutlinedButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        _isVisible =
                                                            !_isVisible;
                                                      });
                                                    },
                                                    child: const Text('Clear'),
                                                  ),
                                                )
                                              : Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        context
                                                            .read<Accepting>()
                                                            .accrpted(data);
                                                      },
                                                      child:
                                                          const Text('Accept'),
                                                    ),
                                                    data.decline == true
                                                        ? const SizedBox()
                                                        : ElevatedButton(
                                                            onPressed: () {
                                                              context
                                                                  .read<
                                                                      Accepting>()
                                                                  .decline(
                                                                      data);
                                                            },
                                                            child: const Text(
                                                              'Decline',
                                                            ),
                                                          )
                                                  ],
                                                )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  );
          } else if (snapshot.hasError) {
            log(
              'error${snapshot.hasError}'.toString(),
            );
            log(snapshot.error.toString());
            return Center(
              child: Text('Someting Went Wrong ${snapshot.error}'),
            );
          } else {
            return Container(
              height: 10,
              color: Colors.red,
            );
          }
        },
      ),
    );
  }
}

Shimmer getShimmerLoading() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 100,
          width: 100,
          color: Colors.white,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 18.0,
              color: Colors.white,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 14.0,
              color: Colors.white,
            )
          ],
        ))
      ],
    ),
  );
}
