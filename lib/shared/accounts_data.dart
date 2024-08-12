import 'package:expense_manager/models/account.dart';
import 'package:expense_manager/models/category.dart';
import 'package:expense_manager/providers/filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final List<Account> accounts = [
  Account(
    id: '1',
    name: 'Checking Account',
    type: 'Checking',
    balance: 1500.00,
    category: Category(
      name: 'Banking',
      color: Colors.blue,
      icon: FontAwesomeIcons.buildingColumns,
      type: Transaction.accounts,
    ),
  ),
  Account(
    id: '2',
    name: 'Savings Account',
    type: 'Savings',
    balance: 5000.00,
    category: Category(
      name: 'Savings Account',
      color: Colors.green,
      icon: FontAwesomeIcons.piggyBank,
      type: Transaction.accounts,
    ),
  ),
  Account(
    id: '3',
    name: 'Credit Card',
    type: 'Credit',
    balance: -200.00, // Negative balance indicating debt
    category: Category(
      name: 'Debt',
      color: Colors.red,
      icon: FontAwesomeIcons.creditCard,
      type: Transaction.accounts,
    ),
  ),
  Account(
    id: '4',
    name: 'Investment Account',
    type: 'Investment',
    balance: 12000.00,
    category: Category(
      name: 'Investment',
      color: Colors.purple,
      icon: FontAwesomeIcons.chartLine,
      type: Transaction.accounts,
    ),
  ),
  Account(
    id: '5',
    name: 'Emergency Fund',
    type: 'Savings',
    balance: 3000.00,
    category: Category(
      name: 'Emergency',
      color: Colors.orange,
      icon: FontAwesomeIcons.triangleExclamation,
      type: Transaction.accounts,
    ),
  ),
];
