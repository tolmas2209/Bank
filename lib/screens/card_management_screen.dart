import 'package:flutter/material.dart';
import '../core/routes/app_routes.dart';
import '../data/card_repository.dart';
import '../widgets/bank_card_widget.dart';
import '../widgets/page_header.dart';

class CardManagementScreen extends StatelessWidget {
  const CardManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cards = CardRepository.cards;
    return SafeArea(
      child: Column(
        children: [
          PageHeader(title: 'All Cards'),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.fromLTRB(24, 8, 24, 120),
              itemCount: cards.length,
              separatorBuilder: (_, _) => SizedBox(height: 20),
              itemBuilder: (context, index) => BankCardWidget(
                card: cards[index],
                showHolder: true,
                onTap: () => Navigator.pushNamed(
                  context,
                  AppRoutes.cardDetails,
                  arguments: cards[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
