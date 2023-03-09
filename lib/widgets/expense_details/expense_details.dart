import 'package:collection/collection.dart';
import 'package:expense_planner/providers/expense_provider.dart';
import 'package:expense_planner/widgets/expense_details/expense_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_month_picker/flutter_month_picker.dart';
import 'package:intl/intl.dart';

class ExpenseDetails extends StatefulWidget {
  final List<Expense> expenses;
  const ExpenseDetails({
    required this.expenses,
    super.key,
  });

  @override
  State<ExpenseDetails> createState() => _ExpenseDetailsState();
}

class _ExpenseDetailsState extends State<ExpenseDetails> {
  DateTime? _selectedMonth;
  List<Expense> get filteredTx {
    String key = _selectedMonth == null
        ? ".."
        : DateFormat("MM/yy").format(_selectedMonth!);
    return widget.expenses
        .where(
          (expense) => expense.key.contains(key),
        )
        .toList();
  }

  Map<String, List<Expense>> get groupTx {
    var newMap = groupBy(filteredTx, (obj) => obj.key);
    return newMap;
  }

  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        SizedBox(
          height: (MediaQuery.of(context).size.height -
                  AppBar().preferredSize.height) *
              0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Expenses",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () async {
                  final selectedMonth = await showMonthPicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2021),
                    lastDate: DateTime.now(),
                  );
                  if (selectedMonth == null) {
                    return;
                  }
                  _selectedMonth = selectedMonth;
                },
                child: Text(
                  _selectedMonth == null
                      ? "Select Month"
                      : DateFormat.yMMMM().format(_selectedMonth!),
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: (MediaQuery.of(context).size.height -
                  AppBar().preferredSize.height) *
              0.9,
          child: ExpenseList(groupTx: groupTx),
        ),
      ]),
    );
  }
}
