import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/home_page.dart';
import '../../viewmodel/bootom_nav.dart';
import '../bokked/booking_notification.dart';
import '../chat/chat.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Widget> pages = [
    BookingNotification(),
    Home(),
    const ChatScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<BotomNav>(
      builder: (context, value, child) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            onTap: value.onTap,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: true,
            currentIndex: value.currentIndex,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(
                label: 'Notificatios',
                tooltip: 'Home',
                icon: Icon(Icons.notification_important_outlined),
              ),
              BottomNavigationBarItem(
                label: 'Accont',
                tooltip: 'Accont',
                icon: Icon(Icons.account_box_outlined),
              ),
              BottomNavigationBarItem(
                label: 'Chats',
                tooltip: 'Chats',
                icon: Icon(Icons.chat_bubble_outline_outlined),
              ),
            ],
          ),
          body: pages[value.currentIndex],
        );
      },
    );
  }
}
