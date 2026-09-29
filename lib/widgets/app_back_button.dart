import 'package:flutter/material.dart';
import '../const/colors/app_colors.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: AppColors.navy,
        size: 22,
      ),
    );
  }
}