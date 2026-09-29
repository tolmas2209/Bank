import 'package:flutter/material.dart';
import '../const/colors/app_colors.dart';
import '../core/utils/formatters.dart';
import '../models/transaction_model.dart';

class TransactionTile extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionTile({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final income = transaction.isIncome;
    return Row(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(
            income ? Icons.arrow_back : Icons.arrow_forward,
            color: income ? AppColors.income : AppColors.expense,
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.title,
                style: TextStyle(fontSize: 19, color: AppColors.navy),
              ),
              SizedBox(height: 4),
              Text(
                transaction.date,
                style: TextStyle(fontSize: 16, color: AppColors.muted),
              ),
            ],
          ),
        ),
        Text(
          Formatters.currency(transaction.amount, signed: true),
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: income ? AppColors.muted : AppColors.navy,
          ),
        ),
      ],
    );
  }
}
