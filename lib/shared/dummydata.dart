// import 'package:expense_manager/models/category.dart';
// import 'package:expense_manager/models/expense.dart';
// import 'package:expense_manager/models/income.dart';
// import 'package:expense_manager/providers/filter_provider.dart';
// import 'package:expense_manager/shared/categorydata.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:intl/intl.dart';

// final List<Expense> expensesData = [
//   Expense(
//     transactionId: '1',
//     accountId: '1',
//     amount: 100.00,
//     category: Category(
//       name: 'Groceries',
//       color: Colors.green,
//       icon: FontAwesomeIcons.basketShopping,
//       type: Transaction.expense,
//     ),
//     transactionDate: DateTime(2024, 1, 2),
//     description: 'Supermarket purchase',
//     key: DateFormat("E dd/MM/yy").format(DateTime(2024, 1, 2)),
//     budgetId: "001",
//   ),
//   Expense(
//     transactionId: '2',
//     accountId: '2',
//     amount: 50.00,
//     category: Category(
//       name: 'Transport',
//       color: Colors.blue,
//       icon: FontAwesomeIcons.car,
//       type: Transaction.expense,
//     ),
//     transactionDate: DateTime(2024, 1, 2),
//     description: 'Gas station',
//     key: DateFormat("E dd/MM/yy").format(DateTime(2024, 1, 2)),
//     budgetId: "001",
//   ),
//   Expense(
//     transactionId: '3',
//     accountId: '3',
//     amount: 75.00,
//     category: Category(
//       name: 'Dining',
//       color: Colors.teal,
//       icon: FontAwesomeIcons.utensils,
//       type: Transaction.expense,
//     ),
//     transactionDate: DateTime(2024, 1, 2),
//     description: 'Restaurant bill',
//     key: DateFormat("E dd/MM/yy").format(DateTime(2024, 1, 2)),
//     budgetId: "001",
//   ),
//   Expense(
//     transactionId: '4',
//     accountId: '4',
//     amount: 30.00,
//     category: Category(
//       name: 'Entertainment',
//       color: Colors.black12,
//       icon: FontAwesomeIcons.film,
//       type: Transaction.expense,
//     ),
//     transactionDate: DateTime(2024, 1, 3),
//     description: 'Movie tickets',
//     key: DateFormat("E dd/MM/yy").format(DateTime(2024, 1, 3)),
//     budgetId: "001",
//   ),
//   Expense(
//     transactionId: '5',
//     accountId: '5',
//     amount: 150.00,
//     category: Category(
//       name: 'Utilities',
//       color: Colors.yellow,
//       icon: FontAwesomeIcons.lightbulb,
//       type: Transaction.expense,
//     ),
//     transactionDate: DateTime(2024, 1, 3),
//     description: 'Electricity bill',
//     key: DateFormat("E dd/MM/yy").format(DateTime(2024, 1, 3)),
//     budgetId: "001",
//   ),
//   Expense(
//     transactionId: '6',
//     accountId: '6',
//     amount: 200.00,
//     category: Category(
//       name: 'Rent',
//       color: Colors.lightGreen,
//       icon: FontAwesomeIcons.house,
//       type: Transaction.expense,
//     ),
//     transactionDate: DateTime(2024, 1, 4),
//     description: 'Monthly rent',
//     key: DateFormat("E dd/MM/yy").format(DateTime(2024, 1, 4)),
//     budgetId: "001",
//   ),
//   Expense(
//     transactionId: '7',
//     accountId: '7',
//     amount: 20.00,
//     category: Category(
//       name: 'Miscellaneous',
//       color: Colors.orange,
//       icon: FontAwesomeIcons.box,
//       type: Transaction.expense,
//     ),
//     transactionDate: DateTime(2024, 1, 6),
//     description: 'Stationery',
//     key: DateFormat("E dd/MM/yy").format(DateTime(2024, 1, 6)),
//     budgetId: "001",
//   ),
//   Expense(
//     transactionId: '8',
//     accountId: '8',
//     amount: 250.00,
//     category: Category(
//       name: 'Shopping',
//       color: Colors.purple,
//       icon: FontAwesomeIcons.bagShopping,
//       type: Transaction.expense,
//     ),
//     transactionDate: DateTime(2024, 2, 2),
//     description: 'Clothing',
//     key: DateFormat("E dd/MM/yy").format(DateTime(2024, 2, 2)),
//     budgetId: "001",
//   ),
//   Expense(
//     transactionId: '9',
//     accountId: '9',
//     amount: 500.00,
//     category: Category(
//       name: 'Insurance',
//       color: Colors.blue,
//       icon: FontAwesomeIcons.fileContract,
//       type: Transaction.expense,
//     ),
//     transactionDate: DateTime(2024, 2, 6),
//     description: 'Car insurance',
//     key: DateFormat("E dd/MM/yy").format(DateTime(2024, 2, 6)),
//     budgetId: "001",
//   ),
//   Expense(
//     transactionId: '10',
//     accountId: '10',
//     amount: 100.00,
//     category: Category(
//       name: 'Healthcare',
//       color: Colors.red,
//       icon: FontAwesomeIcons.heartPulse,
//       type: Transaction.expense,
//     ),
//     transactionDate: DateTime(2024, 3, 7),
//     description: 'Doctor\'s appointment',
//     key: DateFormat("E dd/MM/yy").format(DateTime(2024, 3, 7)),
//     budgetId: "001",
//   ),
//   Expense(
//     transactionId: '11',
//     accountId: '11',
//     amount: 60.00,
//     category: Category(
//       name: 'Groceries',
//       color: Colors.green,
//       icon: FontAwesomeIcons.basketShopping,
//       type: Transaction.expense,
//     ),
//     transactionDate: DateTime(2024, 3, 7),
//     description: 'Supermarket purchase',
//     key: DateFormat("E dd/MM/yy").format(DateTime(2024, 3, 7)),
//     budgetId: "001",
//   ),
//   Expense(
//     transactionId: '12',
//     accountId: '12',
//     amount: 80.00,
//     category: Category(
//       name: 'Transport',
//       color: Colors.blue,
//       icon: FontAwesomeIcons.car,
//       type: Transaction.expense,
//     ),
//     transactionDate: DateTime(2024, 3, 7),
//     description: 'Gas station',
//     key: DateFormat("E dd/MM/yy").format(DateTime(2024, 3, 7)),
//     budgetId: "001",
//   ),
//   Expense(
//     transactionId: '13',
//     accountId: '13',
//     amount: 45.00,
//     category: Category(
//       name: 'Dining',
//       color: Colors.teal,
//       icon: FontAwesomeIcons.utensils,
//       type: Transaction.expense,
//     ),
//     transactionDate: DateTime(2024, 4, 4),
//     description: 'Restaurant bill',
//     key: DateFormat("E dd/MM/yy").format(DateTime(2024, 4, 4)),
//     budgetId: "001",
//   ),
//   Expense(
//     transactionId: '14',
//     accountId: '14',
//     amount: 35.00,
//     category: Category(
//       name: 'Entertainment',
//       color: Colors.black12,
//       icon: FontAwesomeIcons.film,
//       type: Transaction.expense,
//     ),
//     transactionDate: DateTime(2024, 4, 4),
//     description: 'Concert tickets',
//     key: DateFormat("E dd/MM/yy").format(DateTime(2024, 4, 4)),
//     budgetId: "001",
//   ),
//   Expense(
//     transactionId: '15',
//     accountId: '15',
//     amount: 90.00,
//     category: Category(
//       name: 'Utilities',
//       color: Colors.yellow,
//       icon: FontAwesomeIcons.lightbulb,
//       type: Transaction.expense,
//     ),
//     transactionDate: DateTime(2024, 4, 4),
//     description: 'Water bill',
//     key: DateFormat("E dd/MM/yy").format(DateTime(2024, 4, 4)),
//     budgetId: "001",
//   ),
// ];

// final List<Income> incomeData = [
//   Income(
//       id: '1',
//       accountId: '1',
//       amount: 3000.00,
//       category: Categories.getCategory('Salary'),
//       date: DateTime(2024, 1, 5),
//       description: 'Monthly salary',
//       key: DateFormat("E dd/MM/yy").format(DateTime(2024, 1, 5)),
//       budgetId: "001"),
//   Income(
//       id: '2',
//       accountId: '2',
//       amount: 500.00,
//       category: Categories.getCategory('Freelance'),
//       date: DateTime(2024, 1, 10),
//       description: 'Website development project',
//       key: DateFormat("E dd/MM/yy").format(DateTime(2024, 1, 10)),
//       budgetId: "001"),
//   Income(
//       id: '3',
//       accountId: '3',
//       amount: 200.00,
//       category: Categories.getCategory('Interest'),
//       date: DateTime(2024, 2, 15),
//       description: 'Savings account interest',
//       key: DateFormat("E dd/MM/yy").format(DateTime(2024, 2, 15)),
//       budgetId: "001"),
//   Income(
//       id: '4',
//       accountId: '4',
//       amount: 400.00,
//       category: Categories.getCategory('Rental Income'),
//       date: DateTime(2024, 2, 20),
//       description: 'Apartment rent',
//       key: DateFormat("E dd/MM/yy").format(DateTime(2024, 2, 20)),
//       budgetId: "001"),
//   Income(
//       id: '5',
//       accountId: '5',
//       amount: 250.00,
//       category: Categories.getCategory('Dividends'),
//       date: DateTime(2024, 3, 10),
//       description: 'Stock dividends',
//       key: DateFormat("E dd/MM/yy").format(DateTime(2024, 3, 10)),
//       budgetId: "001"),
//   Income(
//       id: '6',
//       accountId: '6',
//       amount: 150.00,
//       category: Categories.getCategory('Royalties'),
//       date: DateTime(2024, 3, 15),
//       description: 'Book royalties',
//       key: DateFormat("E dd/MM/yy").format(DateTime(2024, 3, 15)),
//       budgetId: "001"),
//   Income(
//       id: '7',
//       accountId: '7',
//       amount: 100.00,
//       category: Categories.getCategory('Grants'),
//       date: DateTime(2024, 4, 5),
//       description: 'Research grant',
//       key: DateFormat("E dd/MM/yy").format(DateTime(2024, 4, 5)),
//       budgetId: "001"),
//   Income(
//       id: '8',
//       accountId: '8',
//       amount: 600.00,
//       category: Categories.getCategory('Business'),
//       date: DateTime(2024, 4, 10),
//       description: 'Small business sales',
//       key: DateFormat("E dd/MM/yy").format(DateTime(2024, 4, 10)),
//       budgetId: "001"),
//   Income(
//       id: '9',
//       accountId: '9',
//       amount: 300.00,
//       category: Categories.getCategory('Sale of Assets'),
//       date: DateTime(2024, 5, 2),
//       description: 'Sold old furniture',
//       key: DateFormat("E dd/MM/yy").format(DateTime(2024, 5, 2)),
//       budgetId: "001"),
//   Income(
//       id: '10',
//       accountId: '10',
//       amount: 150.00,
//       category: Categories.getCategory('Scholarships'),
//       date: DateTime(2024, 5, 10),
//       description: 'Academic scholarship',
//       key: DateFormat("E dd/MM/yy").format(DateTime(2024, 5, 10)),
//       budgetId: "001"),
// ];
