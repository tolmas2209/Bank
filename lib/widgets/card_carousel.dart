import 'package:flutter/material.dart';
import '../models/card_model.dart';
import 'bank_card_widget.dart';

class CardCarousel extends StatefulWidget {
  final List<CardModel> cards;
  final ValueChanged<CardModel> onCardTap;
  const CardCarousel({super.key, required this.cards, required this.onCardTap});
  @override
  State<CardCarousel> createState() => _CardCarouselState();
}

class _CardCarouselState extends State<CardCarousel> {
  final PageController controller = PageController(viewportFraction: 0.92);
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.maxWidth * 0.92 / 1.64;
        return SizedBox(
          height: height,
          child: PageView.builder(
            controller: controller,
            padEnds: false,
            itemCount: widget.cards.length,
            itemBuilder: (context, index) {
              final card = widget.cards[index];
              return Padding(
                padding: EdgeInsets.only(right: 12),
                child: BankCardWidget(
                  card: card,
                  onTap: () => widget.onCardTap(card),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
