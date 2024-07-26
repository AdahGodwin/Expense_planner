import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:intl/intl.dart";

import '../db_helpers/db_helper.dart';

class Income {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  String key;

  Income({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.key,
  });
}

class IncomeNotifier extends StateNotifier<List<Income>> {
  IncomeNotifier() : super([]);

  // List<Income> get allIncome {
  //   return [...income];
  // }

  List<Income> get recentTransactions {
    return state.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  List<Income> get todaysIncome {
    String key = DateFormat("E dd/MM/yy").format(DateTime.now());
    return state.where((income) {
      return income.key.contains(key);
    }).toList();
  }

  String get totalMonthlyIncome {
    String key = DateFormat("MM/yy").format(DateTime.now());
    List<Income> monthlyEarnings = state.where((income) {
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
    return NumberFormat.compactSimpleCurrency(name: "NGN").format(todaysTotal);
  }

  void addIncome(
    BuildContext context,
    String title,
    double amount,
    DateTime date,
    String key,
  ) {
    final newIncome = Income(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: date,
      key: key,
    );
    DBHelper.insert("income", {
      "id": newIncome.id,
      "title": newIncome.title,
      "amount": newIncome.amount,
      "date": newIncome.date.millisecondsSinceEpoch,
      "key": newIncome.key,
    });
    // Provider.of<Auth>(context, listen: false).updateBalance(false, amount);
  }

  Future<void> fetchAndSetIncome() async {
    final dataList = await DBHelper.getData('income');
    state = dataList
        .map((income) => Income(
              id: income['id'],
              title: income['title'],
              amount: double.parse(income['amount'].toString()),
              date: DateTime.fromMillisecondsSinceEpoch(income['date']),
              key: income['key'],
            ))
        .toList();
  }

  void deleteTransaction(String id) {
    // income.removeWhere((tx) => tx.id == id);
  }
}

final incomeProvider =
    StateNotifierProvider<IncomeNotifier, List<Income>>((ref) {
  return IncomeNotifier();
});
