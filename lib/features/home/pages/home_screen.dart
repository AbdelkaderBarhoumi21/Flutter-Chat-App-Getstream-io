import 'package:flutter/material.dart';
import 'package:flutter_chat_app_gestream_io/core/common/widgets/avatar/avatar.dart';
import 'package:flutter_chat_app_gestream_io/core/utils/constants/app_constants.dart';
import 'package:flutter_chat_app_gestream_io/core/utils/helpers/app_helpers.dart';
import 'package:flutter_chat_app_gestream_io/features/calls/pages/calls_screen.dart';
import 'package:flutter_chat_app_gestream_io/features/contacts/pages/contacts_screen.dart';
import 'package:flutter_chat_app_gestream_io/core/common/widgets/buttons/custom_icon_buttons.dart';
import 'package:flutter_chat_app_gestream_io/features/home/widgets/custom_navigation_bar_view.dart';
import 'package:flutter_chat_app_gestream_io/features/messages/pages/messages_screen.dart';
import 'package:flutter_chat_app_gestream_io/features/notificattions/pages/notificattions_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final ValueNotifier<String> title = ValueNotifier('Messages');

  final List<Widget> _pages = const [
    MessagesScreen(),
    NotificationsScreen(),
    CallsScreen(),
    ContactsScreen(),
  ];
  final _pageTitles = const ['Messages', 'Notifications', 'Calls', 'Contacts'];

  void _onNavigationItemSelected(int index) {
    title.value = _pageTitles[index];
    pageIndex.value = index;
  }

  @override
  void dispose() {
    pageIndex.dispose();
    title.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      iconTheme: Theme.of(context).iconTheme,
      centerTitle: true,
      title: ValueListenableBuilder(
        valueListenable: title,
        builder: (context, value, child) => Text(value),
      ),
      leadingWidth: 54,
      leading: Align(
        alignment: Alignment.centerRight,
        child: IconBackgroundButtons(
          icon: Icons.search,
          onTap: () {
            logger.i('TODO search');
          },
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 24.0),
          child: Hero(
            tag: 'hero-profile-picture',
            child: Avatar.small(
              url: AppHelpers.randomPictureUrl(),
              onTap: () {},
            ),
          ),
        ),
      ],
    ),

    body: ValueListenableBuilder(
      valueListenable: pageIndex,
      builder: (context, value, child) => _pages[value],
    ),
    bottomNavigationBar: CustomBottomNavigationBarView(
      onItemSelected: _onNavigationItemSelected,
    ),
  );
}
