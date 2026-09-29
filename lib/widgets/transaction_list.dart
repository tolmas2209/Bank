import 'package:flutter/material.dart';
import '../models/transaction_model.dart';
import 'section_title.dart';
import 'transaction_tile.dart';

class TransactionList extends StatelessWidget {
  final List<TransactionModel> items;
  const TransactionList({super.key, required this.items});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle('Transactions History'),
        SizedBox(height: 20),
        for (final item in items) ...[
          TransactionTile(transaction: item),
          SizedBox(height: 16),
        ],
      ],
    );
  }
}
