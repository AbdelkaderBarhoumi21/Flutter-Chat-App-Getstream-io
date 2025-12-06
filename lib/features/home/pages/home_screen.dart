import 'package:flutter/material.dart';
import 'package:flutter_chat_app_gestream_io/features/calls/pages/calls_screen.dart';
import 'package:flutter_chat_app_gestream_io/features/contacts/pages/contacts_screen.dart';
import 'package:flutter_chat_app_gestream_io/features/home/widgets/custom_navigation_bar_view.dart';
import 'package:flutter_chat_app_gestream_io/features/messages/pages/messages_screen.dart';
import 'package:flutter_chat_app_gestream_io/features/notificattions/pages/notificattions_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Widget> _pages = const [
    MessagesScreen(),
    NotificationsScreen(),
    CallsScreen(),
    ContactsScreen(),
  ];
  final pageTitles = const [
    'Messages',
    'Notifications',
    'Calls',
    'Contacts',
  ];

  void _onNavigationItemSelected(int index){
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[0],
      bottomNavigationBar: CustomBottomNavigationBarView(),
    );
  }
}
