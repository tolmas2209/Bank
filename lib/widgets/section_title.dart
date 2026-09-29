import 'package:flutter/material.dart';
import '../const/colors/app_colors.dart';

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: AppColors.navy,
      ),
    );
  }
}
