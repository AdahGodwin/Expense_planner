import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Category {
  static IconData getIconForCategory(String categoryName) {
    switch (categoryName) {
      case 'Groceries':
        return FontAwesomeIcons.basketShopping;
      case 'Transport':
        return FontAwesomeIcons.car;
      case 'Dining':
        return FontAwesomeIcons.utensils;
      case 'Entertainment':
        return FontAwesomeIcons.film;
      case 'Utilities':
        return FontAwesomeIcons.lightbulb;
      case 'Rent':
        return FontAwesomeIcons.house;
      case 'Miscellaneous':
        return FontAwesomeIcons.box;
      case 'Shopping':
        return FontAwesomeIcons.bagShopping;
      case 'Insurance':
        return FontAwesomeIcons.fileContract;
      case 'Healthcare':
        return FontAwesomeIcons.heartPulse;
      default:
        return FontAwesomeIcons.question;
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
    "Healthcare"
  ];
}
