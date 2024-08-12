import "package:collection/collection.dart";
import "package:expense_manager/models/income.dart";
import "package:expense_manager/shared/categorydata.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:intl/intl.dart";

import '../db_helpers/db_helper.dart';

class IncomeNotifier extends StateNotifier<List<Income>> {
  IncomeNotifier() : super([]);

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

  Map<String, List<Income>> get groupTx {
    var newMap = groupBy(
        state.sorted((a, b) => a.date.compareTo(b.date)), (obj) => obj.key);
    return newMap;
  }

  void addIncome({
    required String description,
    required double amount,
    required DateTime date,
    required String key,
    required String accountId,
    required String categoryName,
    required String budgetId,
  }) async {
    final newIncome = Income(
      id: DateTime.now().toString(),
      description: description,
      amount: amount,
      date: date,
      key: key,
      accountId: accountId,
      budgetId: budgetId,
      category: Categories.getCategory(categoryName),
    );
    await DBHelper.insert("income", {
      "id": newIncome.id,
      "description": newIncome.description,
      "amount": newIncome.amount,
      "date": newIncome.date.millisecondsSinceEpoch,
      "key": newIncome.key,
      "category": newIncome.category.name,
      "accountId": newIncome.accountId,
      "budgetId": newIncome.budgetId,
    });

    await fetchAndSetIncome();
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
              category: Categories.getCategory(income["category"]),
              accountId: income["accountId"],
              budgetId: income["budgetId"],
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
