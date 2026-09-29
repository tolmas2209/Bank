import 'package:flutter/material.dart';
import '../const/colors/app_colors.dart';
import 'notification_button.dart';

class PageHeader extends StatelessWidget {
  final String title;
  final Widget? leading;
  final bool showBell;
  const PageHeader({
    super.key,
    this.title = '',
    this.leading,
    this.showBell = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 24, 16),
      child: Row(
        children: [
          SizedBox(width: 48, child: leading),
          Expanded(
            child: Center(
              child: Text(
                title,
                style: TextStyle(fontSize: 20, color: AppColors.navy),
              ),
            ),
          ),
          showBell ? NotificationButton() : SizedBox(width: 48),
        ],
      ),
    );
  }
}
