import 'package:expense_manager/models/category.dart';
import 'package:expense_manager/providers/filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Categories {
  static Category getCategory(String categoryName) {
    for (Category category in categories) {
      if (category.name == categoryName) {
        return category;
      }
    }
    // Default category if not found
    return Category(
      name: "Other",
      color: Colors.black,
      icon: FontAwesomeIcons.question,
      type: Transaction.expense,
    );
  }
}

final List<Category> categories = [
  Category(
    name: 'Groceries',
    color: Colors.green,
    icon: FontAwesomeIcons.basketShopping,
    type: Transaction.expense,
  ),
  Category(
    name: 'Transport',
    color: Colors.blue,
    icon: FontAwesomeIcons.car,
    type: Transaction.expense,
  ),
  Category(
    name: 'Dining',
    color: Colors.teal,
    icon: FontAwesomeIcons.utensils,
    type: Transaction.expense,
  ),
  Category(
    name: 'Entertainment',
    color: Colors.redAccent,
    icon: FontAwesomeIcons.film,
    type: Transaction.expense,
  ),
  Category(
    name: 'Utilities',
    color: Colors.yellow,
    icon: FontAwesomeIcons.lightbulb,
    type: Transaction.expense,
  ),
  Category(
    name: 'Rent',
    color: Colors.lightGreen,
    icon: FontAwesomeIcons.house,
    type: Transaction.expense,
  ),
  Category(
    name: 'Miscellaneous',
    color: Colors.orange,
    icon: FontAwesomeIcons.box,
    type: Transaction.expense,
  ),
  Category(
    name: 'Shopping',
    color: Colors.purple,
    icon: FontAwesomeIcons.bagShopping,
    type: Transaction.expense,
  ),
  Category(
    name: 'Insurance',
    color: Colors.blue,
    icon: FontAwesomeIcons.fileContract,
    type: Transaction.expense,
  ),
  Category(
    name: 'Healthcare',
    color: Colors.red,
    icon: FontAwesomeIcons.heartPulse,
    type: Transaction.expense,
  ),
  Category(
    name: 'Education',
    color: Colors.indigo,
    icon: FontAwesomeIcons.book,
    type: Transaction.expense,
  ),
  Category(
    name: 'Travel',
    color: Colors.cyan,
    icon: FontAwesomeIcons.plane,
    type: Transaction.expense,
  ),
  Category(
    name: 'Personal Care',
    color: Colors.pink,
    icon: FontAwesomeIcons.spa,
    type: Transaction.expense,
  ),
  Category(
    name: 'Savings',
    color: Colors.greenAccent,
    icon: FontAwesomeIcons.piggyBank,
    type: Transaction.expense,
  ),
  Category(
    name: 'Gifts',
    color: Colors.deepOrange,
    icon: FontAwesomeIcons.gift,
    type: Transaction.expense,
  ),
  Category(
    name: 'Subscriptions',
    color: Colors.lightBlue,
    icon: FontAwesomeIcons.clipboardList,
    type: Transaction.expense,
  ),
  Category(
    name: 'Investments',
    color: Colors.deepPurple,
    icon: FontAwesomeIcons.chartLine,
    type: Transaction.expense,
  ),
  Category(
    name: 'Salary',
    color: Colors.green,
    icon: FontAwesomeIcons.moneyBill,
    type: Transaction.income,
  ),
  Category(
    name: 'Business',
    color: Colors.blueAccent,
    icon: FontAwesomeIcons.briefcase,
    type: Transaction.income,
  ),
  Category(
    name: 'Scholarships',
    color: Colors.lightBlue,
    icon: FontAwesomeIcons.graduationCap,
    type: Transaction.income,
  ),
  Category(
    name: 'Interest',
    color: Colors.orange,
    icon: FontAwesomeIcons.percent,
    type: Transaction.income,
  ),
  Category(
    name: 'Dividends',
    color: Colors.lightGreen,
    icon: FontAwesomeIcons.coins,
    type: Transaction.income,
  ),
  Category(
    name: 'Rental Income',
    color: Colors.purple,
    icon: FontAwesomeIcons.house,
    type: Transaction.income,
  ),
  Category(
    name: 'Freelance',
    color: Colors.teal,
    icon: FontAwesomeIcons.laptopCode,
    type: Transaction.income,
  ),
  Category(
    name: 'Capital Gains',
    color: Colors.redAccent,
    icon: FontAwesomeIcons.chartLine,
    type: Transaction.income,
  ),
  Category(
    name: 'Side Hustles',
    color: Colors.amber,
    icon: FontAwesomeIcons.handshakeAngle,
    type: Transaction.income,
  ),
  Category(
    name: 'Royalties',
    color: Colors.deepOrange,
    icon: FontAwesomeIcons.crown,
    type: Transaction.income,
  ),
  Category(
    name: 'Savings Interest',
    color: Colors.greenAccent,
    icon: FontAwesomeIcons.piggyBank,
    type: Transaction.income,
  ),
  Category(
    name: 'Grants',
    color: Colors.indigo,
    icon: FontAwesomeIcons.handHoldingDollar,
    type: Transaction.income,
  ),
  Category(
    name: 'Refunds',
    color: Colors.blueGrey,
    icon: FontAwesomeIcons.arrowRotateLeft,
    type: Transaction.income,
  ),
  Category(
    name: 'Sale of Assets',
    color: Colors.brown,
    icon: FontAwesomeIcons.solidGem,
    type: Transaction.income,
  ),
  Category(
    name: 'Emergency',
    color: Colors.orange,
    icon: FontAwesomeIcons.triangleExclamation,
    type: Transaction.accounts,
  ),
  Category(
    name: 'Banking',
    color: Colors.blue,
    icon: FontAwesomeIcons.buildingColumns,
    type: Transaction.accounts,
  ),
  Category(
    name: 'Savings Account',
    color: Colors.green,
    icon: FontAwesomeIcons.piggyBank,
    type: Transaction.accounts,
  ),
  Category(
    name: 'Debt',
    color: Colors.red,
    icon: FontAwesomeIcons.creditCard,
    type: Transaction.accounts,
  ),
  Category(
    name: 'Investment',
    color: Colors.purple,
    icon: FontAwesomeIcons.chartLine,
    type: Transaction.accounts,
  ),
  Category(
    name: 'Other',
    color: Colors.black,
    icon: FontAwesomeIcons.question,
    type: Transaction.expense,
  ),
  Category(
    name: 'Other Income',
    color: Colors.black,
    icon: FontAwesomeIcons.question,
    type: Transaction.income,
  ),
];
