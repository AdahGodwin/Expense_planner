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
  static const charts = DrawerItem(icon: Icons.home, title: "Home");
  static const expenseDetails = DrawerItem(icon: Icons.home, title: "Home");

  static const incomeDetails = DrawerItem(icon: Icons.home, title: "Home");

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
