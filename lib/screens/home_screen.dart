import 'package:flutter/material.dart';
import '../core/routes/app_routes.dart';
import '../data/card_repository.dart';
import '../data/mock_data.dart';
import '../widgets/card_carousel.dart';
import '../widgets/frequently_used_section.dart';
import '../widgets/menu_button.dart';
import '../widgets/page_header.dart';
import '../widgets/service_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.only(bottom: 120),
        children: [
          PageHeader(leading: MenuButton()),
          Padding(
            padding: EdgeInsets.only(left: 24),
            child: CardCarousel(
              cards: CardRepository.cards,
              onCardTap: (card) => Navigator.pushNamed(
                context,
                AppRoutes.cardDetails,
                arguments: card,
              ),
            ),
          ),
          SizedBox(height: 28),
          Padding(
            padding: EdgeInsets.only(left: 24),
            child: FrequentlyUsedSection(items: MockData.frequentlyUsed),
          ),
          SizedBox(height: 28),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: ServiceSection(items: MockData.services),
          ),
        ],
      ),
    );
  }
}
