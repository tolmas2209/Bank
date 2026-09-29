import 'package:flutter/material.dart';
import '../colors/app_colors.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
      );
}
