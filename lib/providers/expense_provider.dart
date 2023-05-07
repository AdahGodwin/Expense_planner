import "package:expense_planner/providers/auth_provider.dart";
import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:provider/provider.dart";
import '../db_helpers/db_helper.dart';

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
  List<Expense> _expenses = [];

  List<Expense> get allExpenses {
    return [..._expenses];
  }

  List<Expense> get recentTransactions {
    return _expenses.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }
  List<Expense> get todaysExpenses {
    String key = DateFormat("E dd/MM/yy").format(DateTime.now());
    return _expenses.where((expense) {
      return expense.key.contains(key);
    }).toList();
  }

  String get totalMonthlySpending  {
    String key = DateFormat("MM/yy").format(DateTime.now());
    List<Expense> monthlyExpenses = _expenses.where((expense) {
      return expense.key.contains(key);
    }).toList();
     double monthlySpendings = monthlyExpenses.fold(0.0, (sum, item) {
      return sum + item.amount;
    });
    return NumberFormat.compactSimpleCurrency(name: "NGN")
        .format(monthlySpendings);
  }

  String get todaysTotalSpending {
     double todaysTotalSpending = todaysExpenses.fold(0.0, (sum, item) {
      return sum + item.amount;
    });
    return NumberFormat.compactSimpleCurrency(name: "NGN")
        .format(todaysTotalSpending);
  }
  void addExpense(
    BuildContext context,
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

    Provider.of<Auth>(context, listen: false).updateBalance(true, amount);
    DBHelper.insert("expenses", {
      "id": newExpense.id,
      "title": newExpense.title,
      "amount": newExpense.amount,
      "date": newExpense.date.millisecondsSinceEpoch,
      "paymentMethod": newExpense.paymentMethod,
      "key": newExpense.key,
    });
    notifyListeners();
    
  }

  void deleteTransaction(String id) {
    _expenses.removeWhere((tx) => tx.id == id);
  notifyListeners();
  }

  Future<void> fetchAndSetExpenses() async {
   final dataList = await DBHelper.getData('expenses');
   _expenses = dataList.map((expenses) => Expense(
      id: expenses['id'],
      title: expenses['title'],
      amount: double.parse(expenses['amount'].toString()),
      date: DateTime.fromMillisecondsSinceEpoch(expenses['date']),
      paymentMethod: expenses['paymentMethod'],
      key: expenses['key'],
    )).toList();
    notifyListeners();
  }
}
