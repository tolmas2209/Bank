import '../const/colors/app_colors.dart';
import '../models/card_model.dart';

class CardRepository {
  static final List<CardModel> cards = [
    CardModel(
      bankName: 'Dutch Bangla Bank',
      lastDigits: '1690',
      type: 'Platinum Plus',
      expiry: '01/22',
      holder: 'Sunny Aveiro',
      network: CardNetwork.visa,
      colors: AppColors.cardGradients[0],
      balance: 3567.12,
    ),
    CardModel(
      bankName: 'Dutch Bangla Bank',
      lastDigits: '1690',
      type: 'Platinum Plus',
      expiry: '01/22',
      holder: 'Sunny Aveiro',
      network: CardNetwork.mastercard,
      colors: AppColors.cardGradients[1],
      balance: 3567.12,
    ),
    CardModel(
      bankName: 'Dutch Bangla Bank',
      lastDigits: '1690',
      type: 'Platinum Plus',
      expiry: '01/22',
      holder: 'Sunny Aveiro',
      network: CardNetwork.visa,
      colors: AppColors.cardGradients[2],
      balance: 3567.12,
    ),
  ];

  static void add(CardModel card) => cards.add(card);
}
