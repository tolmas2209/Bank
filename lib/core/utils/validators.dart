class Validators {
  static String? required(String? value) {
    if (value == null || value.trim().isEmpty) return 'Required';
    return null;
  }

  static String? cardNumber(String? value) {
    final digits = (value ?? '').replaceAll(' ', '');
    if (digits.length != 16) return 'Enter 16 digits';
    return null;
  }

  static String? expiry(String? value) {
    if (!RegExp(r'^(0[1-9]|1[0-2])/\d{2}$').hasMatch(value ?? '')) return 'MM/YY';
    return null;
  }

  static String? cvv(String? value) {
    if ((value ?? '').length != 3) return '3 digits';
    return null;
  }
}
