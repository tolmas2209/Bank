import 'package:bank_ui/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'core/routes/app_router.dart';
import 'core/routes/app_routes.dart';
import 'const/themes/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: AppRoutes.main,
      onGenerateRoute: AppRouter.generate,
      home: MainScreen(),
    );
  }
}
