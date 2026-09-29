import 'package:flutter/material.dart';
import '../models/card_model.dart';
import 'card_network_logo.dart';

class BankCardWidget extends StatelessWidget {
  final CardModel card;
  final bool showHolder;
  final VoidCallback? onTap;
  const BankCardWidget({
    super.key,
    required this.card,
    this.showHolder = false,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 1.64,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: card.colors.reversed.toList(),
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: -6,
                  right: -10,
                  child: Text(
                    'VISA',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.12),
                      fontSize: 92,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(24), child: _content()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _content() {
    final light = TextStyle(color: Colors.white, fontSize: 16);
    final bold = TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    );
    final bottomLeft = showHolder ? card.holder : 'Exp ${card.expiry}';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.account_balance, color: Colors.white, size: 20),
            ),
            SizedBox(width: 10),
            Text(
              card.bankName,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
        Spacer(),
        Text(
          card.maskedNumber,
          style: TextStyle(color: Colors.white, fontSize: 20, letterSpacing: 2),
        ),
        SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(card.type, style: bold),
            showHolder ? Text('Exp ${card.expiry}', style: light) : SizedBox(),
          ],
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(bottomLeft, style: showHolder ? bold : light),
            CardNetworkLogo(network: card.network),
          ],
        ),
      ],
    );
  }
}
