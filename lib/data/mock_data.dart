import 'package:flutter/material.dart';
import '../models/action_item.dart';
import '../models/chart_data.dart';
import '../models/transaction_model.dart';
import '../models/user_model.dart';

enum ChartPeriod { day, month, yearly }

class MockData {
  static final UserModel user = UserModel(
    name: 'Tolmas Fayzullayev',
    email: 'fayzullayevtomas5@gmail.com',
  );

  static final List<ActionItem> frequentlyUsed = [
    ActionItem(label: 'Recharge', icon: Icons.phone, color: Color(0xFF34D399)),
    ActionItem(
      label: 'Payments',
      icon: Icons.receipt_long,
      color: Color(0xFFFF6B6B),
    ),
    ActionItem(label: 'Transfer', icon: Icons.send, color: Color(0xFFFBBF24)),
    ActionItem(label: 'Money', icon: Icons.add_card, color: Color(0xFF6366F1)),
    ActionItem(label: 'History', icon: Icons.history, color: Color(0xFFC084FC)),
  ];
  static final List<ActionItem> services = [
    ActionItem(
      label: 'Open Account',
      icon: Icons.account_balance,
      color: Color(0xFFFF7A59),
    ),
    ActionItem(
      label: 'Manage Cards',
      icon: Icons.credit_card,
      color: Color(0xFF3AA6A0),
    ),
  ];
  static final List<TransactionModel> transactions = [
    TransactionModel(
      title: 'UBER Ride',
      date: '27-Apr  |  08:25pm',
      amount: -574,
    ),
    TransactionModel(
      title: 'Received Money',
      date: '25-Apr  |  10:50am',
      amount: 2047,
    ),
    TransactionModel(
      title: 'Bill Payment',
      date: '22-Apr  |  06:10pm',
      amount: -320,
    ),
  ];
  static final Map<ChartPeriod, ChartData> charts = {
    ChartPeriod.day: ChartData(
      labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
      values: [1200, 900, 1500, 800, 1700, 2100, 1600],
      maxY: 3000,
    ),
    ChartPeriod.month: ChartData(
      labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
      values: [14000, 10000, 10500, 9100, 15000, 21000],
      maxY: 30000,
    ),
    ChartPeriod.yearly: ChartData(
      labels: ['2021', '2022', '2023', '2024', '2025', '2026'],
      values: [60000, 85000, 70000, 110000, 95000, 130000],
      maxY: 150000,
    ),
  };
}
