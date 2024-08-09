import "package:expense_manager/models/income.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:intl/intl.dart";

import '../db_helpers/db_helper.dart';

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
    String description,
    double amount,
    DateTime date,
    String key,
    String accountId,
    String category,
  ) {
    final newIncome = Income(
      id: DateTime.now().toString(),
      description: description,
      amount: amount,
      date: date,
      key: key,
      accountId: accountId,
      category: category,
    );
    DBHelper.insert("income", {
      "id": newIncome.id,
      "description": newIncome.description,
      "amount": newIncome.amount,
      "date": newIncome.date.millisecondsSinceEpoch,
      "key": newIncome.key,
      "category": newIncome.category,
      "accountId": newIncome.accountId,
    });
    // Provider.of<Auth>(context, listen: false).updateBalance(false, amount);
  }

  Future<void> fetchAndSetIncome() async {
    final dataList = await DBHelper.getData('income');
    state = dataList
        .map((income) => Income(
              id: income['id'],
              description: income['description'],
              amount: double.parse(income['amount'].toString()),
              date: DateTime.fromMillisecondsSinceEpoch(income['date']),
              key: income['key'],
              category: income["category"],
              accountId: income["accountId"],
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
