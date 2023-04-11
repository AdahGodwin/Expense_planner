import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:provider/provider.dart";

import "auth_provider.dart";

class IncomeItem {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  String key;

  IncomeItem({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.key,
  });
}

class Income with ChangeNotifier {
  List<IncomeItem> income = [];

  List<IncomeItem> get allIncome {
    return [...income];
  }

  List<IncomeItem> get recentTransactions {
    return income.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  List<IncomeItem> get todaysIncome {
    String key = DateFormat("E dd/MM/yy").format(DateTime.now());
    return income.where((income) {
      return income.key.contains(key);
    }).toList();
  }
  String get totalMonthlyIncome {
    String key = DateFormat("MM/yy").format(DateTime.now());
    List<IncomeItem> monthlyEarnings = income.where((income) {
      return income.key.contains(key);
    }).toList();
     
     double monthlyIncome = monthlyEarnings.fold(0.0, (sum, item) {
      return sum + item.amount;
    });
    return NumberFormat.compactSimpleCurrency(name: "NGN")
        .format(monthlyIncome);
  }
  String get todaysTotalIncome {
    double todaysTotal = todaysIncome.fold(0.0, (sum, item) {
      return sum + item.amount;
    });
    return NumberFormat.compactSimpleCurrency(name: "NGN")
        .format(todaysTotal);
  }

  void addIncome(
    BuildContext context,
    String title,
    double amount,
    DateTime date,
    String key,
  ) {
    final newIncome = IncomeItem(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: date,
      key: key,
    );
    income.add(newIncome);
    Provider.of<Auth>(context, listen: false).updateBalance(false, amount);
    notifyListeners();
  }

  void deleteTransaction(String id) {
    income.removeWhere((tx) => tx.id == id);
  }
}
