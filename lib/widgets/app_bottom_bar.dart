import 'package:flutter/material.dart';
import '../const/colors/app_colors.dart';

class AppBottomBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  AppBottomBar({super.key, required this.currentIndex, required this.onTap});
  final List<IconData> icons = [
    Icons.credit_card,
    Icons.pie_chart,
    Icons.account_balance_wallet,
    Icons.person,
  ];
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      elevation: 12,
      shape: CircularNotchedRectangle(),
      notchMargin: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [_item(0), _item(1), SizedBox(width: 56), _item(2), _item(3)],
      ),
    );
  }

  Widget _item(int index) {
    final selected = index == currentIndex;
    return IconButton(
      onPressed: () => onTap(index),
      icon: Icon(
        icons[index],
        size: 32,
        color: selected ? AppColors.primary : AppColors.border,
      ),
    );
  }
}
