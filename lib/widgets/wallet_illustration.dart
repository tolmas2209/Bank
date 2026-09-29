import 'package:flutter/material.dart';

class WalletIllustration extends StatelessWidget {
  const WalletIllustration({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _ring(210, 0.04),
          _ring(150, 0.06),
          Icon(
            Icons.account_balance_wallet,
            size: 96,
            color: Color(0xFFC47F4E),
          ),
          Positioned(
            top: 30,
            left: 70,
            child: Icon(Icons.credit_card, size: 44, color: Color(0xFFF77F7F)),
          ),
          Positioned(
            top: 34,
            right: 70,
            child: _badge(Icons.account_balance, Color(0xFFA855C7)),
          ),
          Positioned(
            bottom: 60,
            left: 80,
            child: _badge(Icons.euro, Color(0xFF4F63D9)),
          ),
          Positioned(
            bottom: 58,
            right: 96,
            child: _badge(Icons.check, Color(0xFF2CC38F)),
          ),
        ],
      ),
    );
  }

  Widget _ring(double size, double alpha) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.indigo.withValues(alpha: alpha),
      ),
    );
  }

  Widget _badge(IconData icon, Color color) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Icon(icon, color: Colors.white, size: 22),
    );
  }
}
