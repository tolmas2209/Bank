import 'package:flutter/material.dart';
import '../models/card_model.dart';

class CardNetworkLogo extends StatelessWidget {
  final CardNetwork network;
  const CardNetworkLogo({super.key, required this.network});
  @override
  Widget build(BuildContext context) {
    if (network == CardNetwork.visa) {
      return Text(
        'VISA',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.w900,
          fontStyle: FontStyle.italic,
        ),
      );
    }
    return SizedBox(
      width: 60,
      height: 38,
      child: Stack(
        children: [
          Positioned(left: 0, child: _circle(Color(0xFFEB001B))),
          Positioned(
            right: 0,
            child: _circle(Color(0xFFF79E1B).withValues(alpha: 0.9)),
          ),
        ],
      ),
    );
  }

  Widget _circle(Color color) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
