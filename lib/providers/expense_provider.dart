import "package:collection/collection.dart";
import "package:expense_manager/models/expense.dart";
import "package:expense_manager/shared/dummydata.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:intl/intl.dart";
import '../db_helpers/db_helper.dart';

class ExpenseNotifier extends StateNotifier<List<Expense>> {
  ExpenseNotifier() : super(expensesData);

  List<Expense> get recentTransactions {
    return state.where((tx) {
      return tx.transactionDate.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  List<Expense> get todaysExpenses {
    String key = DateFormat("E dd/MM/yy").format(DateTime.now());
    return state.where((expense) {
      return expense.key.contains(key);
    }).toList();
  }

  Map<String, List<Expense>> get groupTx {
    var newMap = groupBy(
        state.sorted((a, b) => a.transactionDate.compareTo(b.transactionDate)),
        (obj) => obj.key);
    return newMap;
  }

  String get totalMonthlySpending {
    String key = DateFormat("MM/yy").format(DateTime.now());
    List<Expense> monthlyExpenses = state.where((expense) {
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
    String description,
    double amount,
    DateTime date,
    String paymentMethod,
    String category,
    String key,
    String budgetId,
    String accountId,
  ) {
    final newExpense = Expense(
      transactionId: DateTime.now().toString(),
      description: description,
      amount: amount,
      transactionDate: date,
      category: category,
      key: key,
      budgetId: budgetId,
      accountId: accountId,
    );

    // Provider.of<Auth>(context, listen: false).updateBalance(true, amount);
    DBHelper.insert("expenses", {
      "id": newExpense.transactionId,
      "description": newExpense.description,
      "amount": newExpense.amount,
      "date": newExpense.transactionDate.millisecondsSinceEpoch,
      "key": newExpense.key,
      "category": newExpense.category,
      "budgetId": newExpense.budgetId,
      "accountId": newExpense.accountId,
    });
  }

  // void deleteTransaction(String id) {
  //   state.removeWhere((tx) => tx.id == id);

  // }

  Future<void> fetchAndSetExpenses() async {
    final dataList = await DBHelper.getData('expenses');
    state = dataList
        .map((expenses) => Expense(
              transactionId: expenses['id'],
              description: expenses['description'],
              amount: double.parse(expenses['amount'].toString()),
              transactionDate:
                  DateTime.fromMillisecondsSinceEpoch(expenses['date']),
              key: expenses['key'],
              category: expenses["category"],
              budgetId: expenses["budgetId"],
              accountId: expenses["accountId"],
            ))
        .toList();
  }
}

final expenseProvider =
    StateNotifierProvider<ExpenseNotifier, List<Expense>>((ref) {
  return ExpenseNotifier();
});
