import 'package:flutter/material.dart';
import '../const/colors/app_colors.dart';

class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 22, color: AppColors.navy),
        ),
      ),
    );
  }
}
