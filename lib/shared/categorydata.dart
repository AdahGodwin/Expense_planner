import 'package:expense_manager/models/category.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Categories {
  static Category getIconForCategory(String categoryName) {
    switch (categoryName) {
      case 'Groceries':
        return Category(
            color: Colors.green, icon: FontAwesomeIcons.basketShopping);
      case 'Transport':
        return Category(color: Colors.blue, icon: FontAwesomeIcons.car);
      case 'Dining':
        return Category(color: Colors.teal, icon: FontAwesomeIcons.utensils);
      case 'Entertainment':
        return Category(color: Colors.black12, icon: FontAwesomeIcons.film);
      case 'Utilities':
        return Category(color: Colors.yellow, icon: FontAwesomeIcons.lightbulb);
      case 'Rent':
        return Category(color: Colors.lightGreen, icon: FontAwesomeIcons.house);
      case 'Miscellaneous':
        return Category(color: Colors.orange, icon: FontAwesomeIcons.box);
      case 'Shopping':
        return Category(
            color: Colors.purple, icon: FontAwesomeIcons.bagShopping);
      case 'Insurance':
        return Category(
            color: Colors.blue, icon: FontAwesomeIcons.fileContract);
      case 'Healthcare':
        return Category(color: Colors.red, icon: FontAwesomeIcons.heartPulse);
      case 'Education':
        return Category(color: Colors.indigo, icon: FontAwesomeIcons.book);
      case 'Travel':
        return Category(color: Colors.cyan, icon: FontAwesomeIcons.plane);
      case 'Personal Care':
        return Category(color: Colors.pink, icon: FontAwesomeIcons.spa);
      case 'Savings':
        return Category(
            color: Colors.greenAccent, icon: FontAwesomeIcons.piggyBank);
      case 'Gifts':
        return Category(color: Colors.deepOrange, icon: FontAwesomeIcons.gift);
      case 'Subscriptions':
        return Category(
            color: Colors.lightBlue, icon: FontAwesomeIcons.clipboardList);
      case 'Investments':
        return Category(
            color: Colors.deepPurple, icon: FontAwesomeIcons.chartLine);
      default:
        return Category(color: Colors.black, icon: FontAwesomeIcons.question);
    }
  }

  static final List<String> categoryNames = [
    "Groceries",
    "Transport",
    "Dining",
    "Entertainment",
    "Utilities",
    "Rent",
    "Miscellaneous",
    "Shopping",
    "Insurance",
    "Healthcare",
    "Education",
    "Travel",
    "Gifts",
    "Personal Care",
    "Savings",
    "Subscriptions",
    "Investments",
  ];
}
