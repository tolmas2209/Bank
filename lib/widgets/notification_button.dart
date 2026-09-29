import 'package:flutter/material.dart';
import '../const/colors/app_colors.dart';
import '../permission/permission_service.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: PermissionService.instance.notification,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 16,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Icon(Icons.notifications, color: AppColors.hint, size: 24),
      ),
    );
  }
}
