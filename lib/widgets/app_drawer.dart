import 'package:flutter/material.dart';
import '../const/colors/app_colors.dart';
import '../data/mock_data.dart';
import '../permission/permission_service.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    final user = MockData.user;
    final permissions = PermissionService.instance;
    return Drawer(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: AppColors.drawerHeader,
            padding: EdgeInsets.fromLTRB(24, 48, 24, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close, color: Colors.white),
                  ),
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        size: 36,
                        color: AppColors.navy,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            user.email,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          _tile(Icons.show_chart, 'My Statistics', () {}),
          _tile(Icons.person_add_alt, 'Invite Friends', permissions.contacts),
          _tile(Icons.settings_outlined, 'Settings', () {}),
          _tile(Icons.dashboard_outlined, 'Discover', () {}),
          _tile(Icons.bar_chart, 'Report', () {}),
          _tile(Icons.alarm, 'Reminder', permissions.notification),
        ],
      ),
    );
  }

  Widget _tile(IconData icon, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(left: 24),
        child: Row(
          children: [
            Icon(icon, color: AppColors.navy, size: 30),
            SizedBox(width: 20),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 28),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.border.withValues(alpha: 0.5),
                    ),
                  ),
                ),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 20, color: AppColors.navy),
                ),
              ),
            ),
            SizedBox(width: 24),
          ],
        ),
      ),
    );
  }
}
