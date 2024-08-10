import 'package:expense_manager/models/category.dart';
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
      type: "expense",
    );
  }
}

final List<Category> categories = [
  Category(
    name: 'Groceries',
    color: Colors.green,
    icon: FontAwesomeIcons.basketShopping,
    type: "expense",
  ),
  Category(
    name: 'Transport',
    color: Colors.blue,
    icon: FontAwesomeIcons.car,
    type: "expense",
  ),
  Category(
    name: 'Dining',
    color: Colors.teal,
    icon: FontAwesomeIcons.utensils,
    type: "expense",
  ),
  Category(
    name: 'Entertainment',
    color: Colors.black12,
    icon: FontAwesomeIcons.film,
    type: "expense",
  ),
  Category(
    name: 'Utilities',
    color: Colors.yellow,
    icon: FontAwesomeIcons.lightbulb,
    type: "expense",
  ),
  Category(
    name: 'Rent',
    color: Colors.lightGreen,
    icon: FontAwesomeIcons.house,
    type: "expense",
  ),
  Category(
    name: 'Miscellaneous',
    color: Colors.orange,
    icon: FontAwesomeIcons.box,
    type: "expense",
  ),
  Category(
    name: 'Shopping',
    color: Colors.purple,
    icon: FontAwesomeIcons.bagShopping,
    type: "expense",
  ),
  Category(
    name: 'Insurance',
    color: Colors.blue,
    icon: FontAwesomeIcons.fileContract,
    type: "expense",
  ),
  Category(
    name: 'Healthcare',
    color: Colors.red,
    icon: FontAwesomeIcons.heartPulse,
    type: "expense",
  ),
  Category(
    name: 'Education',
    color: Colors.indigo,
    icon: FontAwesomeIcons.book,
    type: "expense",
  ),
  Category(
    name: 'Travel',
    color: Colors.cyan,
    icon: FontAwesomeIcons.plane,
    type: "expense",
  ),
  Category(
    name: 'Personal Care',
    color: Colors.pink,
    icon: FontAwesomeIcons.spa,
    type: "expense",
  ),
  Category(
    name: 'Savings',
    color: Colors.greenAccent,
    icon: FontAwesomeIcons.piggyBank,
    type: "expense",
  ),
  Category(
    name: 'Gifts',
    color: Colors.deepOrange,
    icon: FontAwesomeIcons.gift,
    type: "expense",
  ),
  Category(
    name: 'Subscriptions',
    color: Colors.lightBlue,
    icon: FontAwesomeIcons.clipboardList,
    type: "expense",
  ),
  Category(
    name: 'Investments',
    color: Colors.deepPurple,
    icon: FontAwesomeIcons.chartLine,
    type: "expense",
  ),
  Category(
    name: 'Salary',
    color: Colors.green,
    icon: FontAwesomeIcons.moneyBill,
    type: "income",
  ),
  Category(
    name: 'Business',
    color: Colors.blueAccent,
    icon: FontAwesomeIcons.briefcase,
    type: "income",
  ),
  Category(
    name: 'Scholarships',
    color: Colors.lightBlue,
    icon: FontAwesomeIcons.graduationCap,
    type: "income",
  ),
  Category(
    name: 'Interest',
    color: Colors.orange,
    icon: FontAwesomeIcons.percent,
    type: "income",
  ),
  Category(
    name: 'Dividends',
    color: Colors.lightGreen,
    icon: FontAwesomeIcons.coins,
    type: "income",
  ),
  Category(
    name: 'Rental Income',
    color: Colors.purple,
    icon: FontAwesomeIcons.house,
    type: "income",
  ),
  Category(
    name: 'Freelance',
    color: Colors.teal,
    icon: FontAwesomeIcons.laptopCode,
    type: "income",
  ),
  Category(
    name: 'Capital Gains',
    color: Colors.redAccent,
    icon: FontAwesomeIcons.chartLine,
    type: "income",
  ),
  Category(
    name: 'Side Hustles',
    color: Colors.amber,
    icon: FontAwesomeIcons.handshakeAngle,
    type: "income",
  ),
  Category(
    name: 'Royalties',
    color: Colors.deepOrange,
    icon: FontAwesomeIcons.crown,
    type: "income",
  ),
  Category(
    name: 'Savings Interest',
    color: Colors.greenAccent,
    icon: FontAwesomeIcons.piggyBank,
    type: "income",
  ),
  Category(
    name: 'Grants',
    color: Colors.indigo,
    icon: FontAwesomeIcons.handHoldingDollar,
    type: "income",
  ),
  Category(
    name: 'Refunds',
    color: Colors.blueGrey,
    icon: FontAwesomeIcons.arrowRotateLeft,
    type: "income",
  ),
  Category(
    name: 'Sale of Assets',
    color: Colors.brown,
    icon: FontAwesomeIcons.solidGem,
    type: "income",
  ),
  Category(
    name: 'Other Income',
    color: Colors.grey,
    icon: FontAwesomeIcons.question,
    type: "income",
  ),
];
