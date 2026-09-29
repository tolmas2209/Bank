import 'package:flutter/material.dart';
import '../const/colors/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const PrimaryButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 76,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        child: Text(text, style: TextStyle(fontSize: 22)),
      ),
    );
  }
}
