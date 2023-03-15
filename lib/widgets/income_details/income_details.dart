import 'package:collection/collection.dart';
import 'package:expense_planner/widgets/income_details/income_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_month_picker/flutter_month_picker.dart';
import 'package:intl/intl.dart';

import '../../providers/income_provider.dart';

class IncomeDetails extends StatefulWidget {
  final List<IncomeItem> income;
  const IncomeDetails({
    required this.income,
    super.key,
  });

  @override
  State<IncomeDetails> createState() => _IncomeDetailsState();
}

class _IncomeDetailsState extends State<IncomeDetails> {
  DateTime? _selectedMonth;
  List<IncomeItem> get filteredTx {
    String key = _selectedMonth == null
        ? ".."
        : DateFormat("MM/yy").format(_selectedMonth!);
    return widget.income
        .where(
          (expense) => expense.key.contains(key),
        )
        .toList();
  }

  Map<String, List<IncomeItem>> get groupTx {
    var newMap = groupBy(filteredTx.sorted((a, b) => a.date.compareTo(b.date)), (obj) => obj.key);
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
              0.05,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Income Details",
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
                  setState(() {
                  _selectedMonth = selectedMonth;  
                  });
                  
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
              0.95,
          child: IncomeList(groupTx: groupTx, selectedMonth: _selectedMonth,),
        ),
      ]),
    );
  }
}
