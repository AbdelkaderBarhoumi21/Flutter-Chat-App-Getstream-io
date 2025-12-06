import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app_gestream_io/core/common/widgets/buttons/glowing_actions_buttons.dart';
import 'package:flutter_chat_app_gestream_io/core/themes/app_theme.dart';
import 'package:flutter_chat_app_gestream_io/features/home/widgets/custom_navigation_bar_item.dart';

class CustomBottomNavigationBarView extends StatefulWidget {
  const CustomBottomNavigationBarView({
    required this.onItemSelected,
    super.key,
  });
  final ValueChanged<int> onItemSelected;

  @override
  State<CustomBottomNavigationBarView> createState() =>
      _CustomBottomNavigationBarViewState();
}

class _CustomBottomNavigationBarViewState
    extends State<CustomBottomNavigationBarView> {
  int selectedIndex = 0;
  void handleItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Card(
      color: (brightness == Brightness.light) ? Colors.transparent : null,
      elevation: 0,
      margin: EdgeInsets.zero,
      child: SafeArea(
        top: false,
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 8, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomNavigationBarItem(
                index: 0,
                label: 'Messages',
                icon: CupertinoIcons.bubble_left_bubble_right_fill,
                isSelected: (selectedIndex == 0),
                onItemTap: handleItemSelected,
              ),
              CustomNavigationBarItem(
                index: 1,
                label: 'Notifications',
                icon: CupertinoIcons.bell_solid,
                isSelected: (selectedIndex == 1),
                onItemTap: handleItemSelected,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GlowingActionButton(
                  color: AppColors.secondary,
                  icon: CupertinoIcons.add,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => const Dialog(
                        child: AspectRatio(
                          aspectRatio: 8 / 7,
                          child: Text('data'),
                        ),
                      ),
                    );
                  },
                ),
              ),
              CustomNavigationBarItem(
                index: 2,
                label: 'Calls',
                icon: CupertinoIcons.phone_fill,
                isSelected: (selectedIndex == 2),
                onItemTap: handleItemSelected,
              ),
              CustomNavigationBarItem(
                index: 3,
                label: 'Contacts',
                icon: CupertinoIcons.person_2_fill,
                isSelected: (selectedIndex == 3),
                onItemTap: handleItemSelected,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
