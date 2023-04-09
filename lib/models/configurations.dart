import 'package:flutter/material.dart';

class DrawerItem {
  final IconData icon;
  final String title;

  const DrawerItem({
    required this.icon,
    required this.title,
  });
}

class DrawerItems {
  static const home = DrawerItem(icon: Icons.home, title: "Home");
  static const addTx = DrawerItem(icon: Icons.add, title: "Add Transaction");
  static const charts = DrawerItem(icon: Icons.bar_chart, title: "Charts");
  static const expenseDetails = DrawerItem(icon: Icons.money, title: "Expense Details");
  static const incomeDetails = DrawerItem(icon: Icons.monetization_on, title: "Income Details");
  static const settings = DrawerItem(icon: Icons.settings, title: "Settings");
  
  static final List<DrawerItem> all = [
    home,
    addTx,
    charts,
    expenseDetails,
    incomeDetails,
  ];
}

Color primaryGreen = const Color(0xff416d6d);

List<BoxShadow> shadowList = [
  BoxShadow(
      color: Colors.grey[300]!, blurRadius: 30, offset: const Offset(0, 10))
];
