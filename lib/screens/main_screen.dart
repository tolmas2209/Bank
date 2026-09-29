import 'package:bank_ui/screens/card_management_screen.dart';
import 'package:flutter/material.dart';
import '../core/routes/app_routes.dart';
import '../const/colors/app_colors.dart';
import '../widgets/app_bottom_bar.dart';
import '../widgets/app_drawer.dart';
import 'home_screen.dart';
import 'placeholder_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static final int cardsTab = 2;
  int index = 0;
  Future<void> onActionPressed() async {
    if (index != cardsTab) return;
    await Navigator.pushNamed(context, AppRoutes.addCard);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeScreen(),
      PlaceholderScreen(title: 'Statistics'),
      CardManagementScreen(),
      PlaceholderScreen(title: 'Profile'),
    ];
    return Scaffold(
      extendBody: true,
      drawer: AppDrawer(),
      body: IndexedStack(index: index, children: pages),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 68,
        height: 68,
        child: FloatingActionButton(
          onPressed: onActionPressed,
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: CircleBorder(side: BorderSide(color: Colors.white, width: 4)),
          child: Icon(index == cardsTab ? Icons.add : Icons.send, size: 30),
        ),
      ),
      bottomNavigationBar: AppBottomBar(
        currentIndex: index,
        onTap: (value) => setState(() => index = value),
      ),
    );
  }
}
