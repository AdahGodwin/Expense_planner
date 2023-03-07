import "package:flutter/material.dart";
import "package:intl/intl.dart";

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  String paymentMethod;
  String key;

  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.paymentMethod,
    required this.key,
  });
}

class Expenses with ChangeNotifier {
  List<Expense> expenses = [];

  List<Expense> get allExpenses {
    return [...expenses];
  }

  List<Expense> get recentTransactions {
    return expenses.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }
  List<Expense> get todaysExpenses {
    String key = DateFormat("dd/MM/yy").format(DateTime.now());
    return expenses.where((expense) {
      return expense.key.contains(key);
    }).toList();
  }
  double get todaysTotalSpending {
    return todaysExpenses.fold(0.0, (sum, item) {
      return sum + item.amount;
    });
  }
  void addExpense(
    String title,
    double amount,
    DateTime date,
    String paymentMethod,
    String key,
  ) {
    final newExpense = Expense(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: date,
      paymentMethod: paymentMethod,
      key: key,
    );

    expenses.add(newExpense);
    notifyListeners();
  }

  void deleteTransaction(String id) {
    expenses.removeWhere((tx) => tx.id == id);
  }
}
