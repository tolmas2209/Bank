import 'package:flutter/material.dart';
import '../const/colors/app_colors.dart';
import '../models/action_item.dart';

class ServiceCard extends StatelessWidget {
  final ActionItem item;
  final VoidCallback? onTap;
  const ServiceCard({super.key, required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 150,
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(26),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 20,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: item.color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(item.icon, color: item.color, size: 24),
            ),
            Spacer(),
            Text(
              item.label,
              style: TextStyle(fontSize: 18, color: AppColors.navy),
            ),
          ],
        ),
      ),
    );
  }
}
