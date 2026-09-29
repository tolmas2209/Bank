import 'package:flutter/material.dart';
import '../const/colors/app_colors.dart';
import '../core/utils/formatters.dart';

class BalanceCard extends StatelessWidget {
  final double balance;
  const BalanceCard({super.key, required this.balance});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 28),
      decoration: BoxDecoration(
        color: AppColors.balanceBackground,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        children: [
          Text(
            'Current Balance',
            style: TextStyle(color: AppColors.primary, fontSize: 22),
          ),
          SizedBox(height: 8),
          Text(
            Formatters.currency(balance),
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 52,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
