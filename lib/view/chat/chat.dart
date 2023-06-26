import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../model/chatroom/chat_room.dart';
import '../../model/patient/patient.dart';
import 'widgets/chat_screen.dart';

var uuid = const Uuid();

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Future<ChatRoomModel?> getChatroomModel(PatientDetails targetUser) async {
    ChatRoomModel? chatRoom;
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('chatrooms')
        .where('participants.${FirebaseAuth.instance.currentUser!.uid}',
            isEqualTo: true)
        .where('participants.${targetUser.userUid}', isEqualTo: true)
        .get();
    if (snapshot.docs.isNotEmpty) {
      var docData = snapshot.docs[0].data();
      ChatRoomModel existingChatroom =
          ChatRoomModel.fromMap(docData as Map<String, dynamic>);
      chatRoom = existingChatroom;
      log('chatrom alredy created');
    } else {
      log('chatrom not created');
      ChatRoomModel newChatroom = ChatRoomModel(
        chatroomid: uuid.v1(),
        lastMessage: '',
        participants: {
          FirebaseAuth.instance.currentUser!.uid: true,
          targetUser.userUid.toString(): true
        },
      );

      await FirebaseFirestore.instance
          .collection('chatrooms')
          .doc(newChatroom.chatroomid)
          .set(newChatroom.toMap());
      chatRoom = newChatroom;
      log('new chat room created');
    }
    return chatRoom;
  }

  @override
  Widget build(BuildContext context) {
    var userProfile = FirebaseFirestore.instance.collection('userProfile');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: const Text('Chat'),
      ),
      body: StreamBuilder(
          stream: userProfile.where('userUid').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text('No chats'),
              );
            } else if (snapshot.hasData) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        PatientDetails patientDetails = PatientDetails.fromMap(
                            snapshot.data!.docs[index].data());
                        return GestureDetector(
                          onTap: () async {
                            ChatRoomModel? chatRoomModel =
                                await getChatroomModel(patientDetails);
                            if (chatRoomModel != null && mounted) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatScreenMessage(
                                    chatroom: chatRoomModel,
                                    patientDetails: patientDetails,
                                    doctorImage:
                                        patientDetails.profilePic.toString(),
                                    doctorName:
                                        patientDetails.userName.toString(),
                                  ),
                                ),
                              );
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Card(
                              elevation: 1,
                              shadowColor: Colors.black,
                              child: SizedBox(
                                height: 70,
                                child: Center(
                                  child: ListTile(
                                    trailing: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        patientDetails.profilePic.toString(),
                                      ),
                                    ),
                                    title: Text(
                                      patientDetails.userName.toString(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return const Text('Something went rong');
            } else {
              return const Text('chek your internet');
            }
          }),
    );
  }
}
