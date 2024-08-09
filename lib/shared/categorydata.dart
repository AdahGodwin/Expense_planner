import 'package:expense_manager/models/category.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Categories {
  static Category getIconForCategory(String categoryName) {
    switch (categoryName) {
      case 'Groceries':
        return Category(
            color: Colors.green,
            icon: FontAwesomeIcons.basketShopping,
            type: "expense");
      case 'Transport':
        return Category(
            color: Colors.blue, icon: FontAwesomeIcons.car, type: "expense");
      case 'Dining':
        return Category(
            color: Colors.teal,
            icon: FontAwesomeIcons.utensils,
            type: "expense");
      case 'Entertainment':
        return Category(
            color: Colors.black12,
            icon: FontAwesomeIcons.film,
            type: "expense");
      case 'Utilities':
        return Category(
            color: Colors.yellow,
            icon: FontAwesomeIcons.lightbulb,
            type: "expense");
      case 'Rent':
        return Category(
            color: Colors.lightGreen,
            icon: FontAwesomeIcons.house,
            type: "expense");
      case 'Miscellaneous':
        return Category(
            color: Colors.orange, icon: FontAwesomeIcons.box, type: "expense");
      case 'Shopping':
        return Category(
            color: Colors.purple,
            icon: FontAwesomeIcons.bagShopping,
            type: "expense");
      case 'Insurance':
        return Category(
            color: Colors.blue,
            icon: FontAwesomeIcons.fileContract,
            type: "expense");
      case 'Healthcare':
        return Category(
            color: Colors.red,
            icon: FontAwesomeIcons.heartPulse,
            type: "expense");
      case 'Education':
        return Category(
            color: Colors.indigo, icon: FontAwesomeIcons.book, type: "expense");
      case 'Travel':
        return Category(
            color: Colors.cyan, icon: FontAwesomeIcons.plane, type: "expense");
      case 'Personal Care':
        return Category(
            color: Colors.pink, icon: FontAwesomeIcons.spa, type: "expense");
      case 'Savings':
        return Category(
            color: Colors.greenAccent,
            icon: FontAwesomeIcons.piggyBank,
            type: "expense");
      case 'Gifts':
        return Category(
            color: Colors.deepOrange,
            icon: FontAwesomeIcons.gift,
            type: "expense");
      case 'Subscriptions':
        return Category(
            color: Colors.lightBlue,
            icon: FontAwesomeIcons.clipboardList,
            type: "expense");
      case 'Investments':
        return Category(
            color: Colors.deepPurple,
            icon: FontAwesomeIcons.chartLine,
            type: "expense");
      default:
        return Category(
            color: Colors.black,
            icon: FontAwesomeIcons.question,
            type: "expense");
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
