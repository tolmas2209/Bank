import 'package:flutter/material.dart';
import '../../models/card_model.dart';
import '../../screens/add_card_screen.dart';
import '../../screens/card_details_screen.dart';
import '../../screens/main_screen.dart';
import 'app_routes.dart';

class AppRouter {
  static Route<dynamic> generate(RouteSettings settings) {
    if (settings.name == AppRoutes.cardDetails) {
      final card = settings.arguments as CardModel;
      return MaterialPageRoute(builder: (_) => CardDetailsScreen(card: card));
    }
    if (settings.name == AppRoutes.addCard) {
      return MaterialPageRoute<CardModel>(builder: (_) => AddCardScreen());
    }
    return MaterialPageRoute(builder: (_) => MainScreen());
  }
}
