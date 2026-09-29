class Formatters {
  static String currency(double value, {bool signed = false}) {
    final parts = value.abs().toStringAsFixed(2).split('.');
    final whole = parts[0].replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (m) => ',');
    final sign = signed ? (value < 0 ? '-' : '+') : '';
    return '$sign\$$whole.${parts[1]}';
  }

  static String compact(double value) {
    if (value >= 1000) return '\$${(value / 1000).toStringAsFixed(0)}k';
    return '\$${value.toStringAsFixed(0)}';
  }
}
