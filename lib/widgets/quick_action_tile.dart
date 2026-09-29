import 'package:flutter/material.dart';
import '../const/colors/app_colors.dart';
import '../models/action_item.dart';

class QuickActionTile extends StatelessWidget {
  final ActionItem item;
  final VoidCallback? onTap;
  const QuickActionTile({super.key, required this.item, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 84,
        child: Column(
          children: [
            Container(
              width: 84,
              height: 84,
              decoration: BoxDecoration(
                color: item.color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Icon(item.icon, color: item.color, size: 34),
            ),
            SizedBox(height: 10),
            Text(
              item.label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.muted,
                fontSize: 15,
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
