import 'package:flutter/material.dart';
import 'package:flutter_chat_app_gestream_io/core/themes/app_theme.dart';

class CustomNavigationBarItem extends StatelessWidget {
  const CustomNavigationBarItem({
    required this.label,
    required this.icon,
    required this.index,
    required this.onItemTap,
    this.isSelected = false,
    super.key,
  });
  final String label;
  final IconData icon;
  final int index;
  final ValueChanged<int> onItemTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) => GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () {
      onItemTap(index);
    },
    child: SizedBox(
      height: 70,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 22, color: isSelected ? AppColors.secondary : null),
          const SizedBox(height: 8),
          Text(
            label,
            style: isSelected
                ? const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondary,
                  )
                : const TextStyle(fontSize: 11),
          ),
        ],
      ),
    ),
  );
}
