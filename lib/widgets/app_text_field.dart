import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../const/colors/app_colors.dart';

InputDecoration appInputDecoration(String hint) {
  OutlineInputBorder border(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(26),
    borderSide: BorderSide(color: color, width: 1.5),
  );
  return InputDecoration(
    hintText: hint,
    hintStyle: TextStyle(color: AppColors.hint, fontSize: 20),
    contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 22),
    enabledBorder: border(AppColors.border),
    focusedBorder: border(AppColors.primary),
    errorBorder: border(AppColors.expense),
    focusedErrorBorder: border(AppColors.expense),
  );
}

class FieldLabel extends StatelessWidget {
  final String text;
  const FieldLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Text(text, style: TextStyle(fontSize: 22, color: AppColors.navy)),
    );
  }
}

class AppTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? formatters;
  final String? Function(String?)? validator;

  const AppTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.formatters,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FieldLabel(label),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: formatters ?? [],
          validator: validator,
          style: TextStyle(fontSize: 20, color: AppColors.navy),
          decoration: appInputDecoration(hint),
        ),
      ],
    );
  }
}
