import 'package:flutter/material.dart';
import '../const/colors/app_colors.dart';
import 'app_text_field.dart';

class AppDropdownField extends StatelessWidget {
  final String label;
  final String hint;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final String? Function(String?)? validator;
  const AppDropdownField({
    super.key,
    required this.label,
    required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
    this.validator,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FieldLabel(label),
        DropdownButtonFormField<String>(
          initialValue: value,
          validator: validator,
          onChanged: onChanged,
          icon: Icon(Icons.keyboard_arrow_down, color: AppColors.navy),
          style: TextStyle(fontSize: 20, color: AppColors.navy),
          decoration: appInputDecoration(hint),
          items: items
              .map((item) => DropdownMenuItem(value: item, child: Text(item)))
              .toList(),
        ),
      ],
    );
  }
}
