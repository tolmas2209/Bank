import 'package:flutter/painting.dart';

enum CardNetwork { visa, mastercard }

class CardModel {
  final String bankName;
  final String lastDigits;
  final String type;
  final String expiry;
  final String holder;
  final CardNetwork network;
  final List<Color> colors;
  final double balance;

  CardModel({
    required this.bankName,
    required this.lastDigits,
    required this.type,
    required this.expiry,
    required this.holder,
    required this.network,
    required this.colors,
    required this.balance,
  });

  String get maskedNumber => '**** **** **** $lastDigits';
}
