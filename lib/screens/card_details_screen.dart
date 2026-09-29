import 'package:bank_ui/models/card_model.dart';
import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../widgets/app_back_button.dart';
import '../widgets/balance_card.dart';
import '../widgets/balance_chart.dart';
import '../widgets/page_header.dart';
import '../widgets/period_switcher.dart';
import '../widgets/transaction_list.dart';

class CardDetailsScreen extends StatefulWidget {
  final CardModel card;
  const CardDetailsScreen({super.key, required this.card});
  @override
  State<CardDetailsScreen> createState() => _CardDetailsScreenState();
}

class _CardDetailsScreenState extends State<CardDetailsScreen> {
  ChartPeriod period = ChartPeriod.month;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(bottom: 32),
          children: [
            PageHeader(title: 'Card Details', leading: AppBackButton()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  BalanceCard(balance: widget.card.balance),
                  SizedBox(height: 24),
                  PeriodSwitcher(
                    selected: period,
                    onChanged: (value) => setState(() => period = value),
                  ),
                  SizedBox(height: 24),
                  BalanceChart(
                    key: ValueKey(period),
                    data: MockData.charts[period]!,
                  ),
                  SizedBox(height: 24),
                  TransactionList(items: MockData.transactions),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
