import 'package:flutter/material.dart';
import '../const/colors/app_colors.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Scaffold.of(context).openDrawer(),
      icon: Icon(Icons.grid_view_rounded, color: AppColors.navy, size: 28),
    );
  }
}
