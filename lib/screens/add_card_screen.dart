import 'package:flutter/material.dart';
import '../const/colors/app_colors.dart';
import '../core/utils/input_formatters.dart';
import '../core/utils/validators.dart';
import '../data/card_repository.dart';
import '../models/card_model.dart';
import '../widgets/app_back_button.dart';
import '../widgets/app_dropdown_field.dart';
import '../widgets/app_text_field.dart';
import '../widgets/page_header.dart';
import '../widgets/primary_button.dart';
import '../widgets/wallet_illustration.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final expiryController = TextEditingController();
  final cvvController = TextEditingController();
  final List<String> cardTypes = ['Visa', 'Mastercard'];
  String? cardType;

  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    expiryController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  void submit() {
    if (!formKey.currentState!.validate()) return;
    final digits = numberController.text.replaceAll(' ', '');
    final colors =
        AppColors.cardGradients[CardRepository.cards.length %
            AppColors.cardGradients.length];
    final card = CardModel(
      bankName: 'Dutch Bangla Bank',
      lastDigits: digits.substring(digits.length - 4),
      type: cardType!,
      expiry: expiryController.text,
      holder: nameController.text.trim(),
      network: cardType == 'Visa' ? CardNetwork.visa : CardNetwork.mastercard,
      colors: colors,
      balance: 0,
    );
    CardRepository.add(card);
    Navigator.pop(context, card);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.only(bottom: 32),
            children: [
              PageHeader(
                title: 'Add New Card',
                leading: AppBackButton(),
                showBell: false,
              ),
              WalletIllustration(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    AppTextField(
                      label: 'Cardholder Name',
                      hint: 'John Doe',
                      controller: nameController,
                      validator: Validators.required,
                    ),
                    SizedBox(height: 24),
                    AppTextField(
                      label: 'Card Number',
                      hint: 'XXXX XXXX XXXX XXXX',
                      controller: numberController,
                      keyboardType: TextInputType.number,
                      formatters: [CardNumberFormatter()],
                      validator: Validators.cardNumber,
                    ),
                    SizedBox(height: 24),
                    AppDropdownField(
                      label: 'Card Type',
                      hint: 'Choose one',
                      value: cardType,
                      items: cardTypes,
                      onChanged: (value) => setState(() => cardType = value),
                      validator: Validators.required,
                    ),
                    SizedBox(height: 24),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: AppTextField(
                            label: 'Expiry',
                            hint: 'MM/YY',
                            controller: expiryController,
                            keyboardType: TextInputType.number,
                            formatters: [ExpiryFormatter()],
                            validator: Validators.expiry,
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: AppTextField(
                            label: 'CVV',
                            hint: 'XXX',
                            controller: cvvController,
                            keyboardType: TextInputType.number,
                            validator: Validators.cvv,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 32),
                    PrimaryButton(text: 'Add Card', onPressed: submit),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
