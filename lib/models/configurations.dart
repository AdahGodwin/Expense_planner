import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerItem {
  final IconData icon;
  final String title;

  const DrawerItem({
    required this.icon,
    required this.title,
  });
}

class DrawerItems {
  static const home = DrawerItem(icon: FontAwesomeIcons.house, title: "Home");
  static const budget = DrawerItem(
      icon: FontAwesomeIcons.fileInvoiceDollar, title: "All Budgets");
  static const addTx =
      DrawerItem(icon: FontAwesomeIcons.plus, title: "Add Transaction");
  static const regularPayments = DrawerItem(
      icon: FontAwesomeIcons.arrowsRotate, title: "Regular Payments");
  static const accounts =
      DrawerItem(icon: FontAwesomeIcons.receipt, title: "Accounts");
  static const charts =
      DrawerItem(icon: FontAwesomeIcons.chartSimple, title: "Charts");
  static const myTx = DrawerItem(
      icon: FontAwesomeIcons.moneyBill1Wave, title: "All Transactions");
  static const reminders =
      DrawerItem(icon: FontAwesomeIcons.bell, title: "Reminders");
  static const categories =
      DrawerItem(icon: FontAwesomeIcons.list, title: "Categories");
  static const settings =
      DrawerItem(icon: FontAwesomeIcons.gears, title: "Settings");

  static final List<DrawerItem> all = [
    home,
    budget,
    addTx,
    myTx,
    charts,
    regularPayments,
    accounts,
    reminders,
    categories,
    settings,
  ];
}

Color primaryGreen = const Color(0xff416d6d);

List<BoxShadow> shadowList = [
  BoxShadow(
      color: Colors.grey[300]!, blurRadius: 30, offset: const Offset(0, 10))
];
