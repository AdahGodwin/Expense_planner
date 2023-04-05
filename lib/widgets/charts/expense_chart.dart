import 'package:charts_flutter/flutter.dart' as charts;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_month_picker/flutter_month_picker.dart';
import 'package:intl/intl.dart';

import '../../models/bar_chart_model.dart';
import '../../providers/expense_provider.dart';

class ExpenseChart extends StatefulWidget {
  final List<Expense> expenses;
  const ExpenseChart({required this.expenses, super.key});

  @override
  State<ExpenseChart> createState() => _ExpenseChartState();
}

class _ExpenseChartState extends State<ExpenseChart> {
  DateTime? _selectedMonth;

  List<BarChartModel> get groupedTransactionValues {
    List<BarChartModel> grouptx = [];
    String key = _selectedMonth == null
        ? ".."
        : DateFormat("MM/yy").format(_selectedMonth!);

    List<Expense> filteredTx = widget.expenses
        .where(
          (expense) => expense.key.contains(key),
        )
        .toList();
      if (filteredTx.isEmpty) {
        return [];
      }
    var groupedExpenses = groupBy(
        filteredTx.sorted((a, b) => a.date.compareTo(b.date)), (obj) => obj.key);

    groupedExpenses.forEach((day, expenses) {
      double totalSum = expenses.fold(0.0, (sum, item) {
        return sum + item.amount;
      });

      grouptx.add(BarChartModel(
          day: day,
          amount: totalSum,
          color: charts.ColorUtil.fromDartColor(Colors.pink)));
    });
    return grouptx;
  }

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
        id: "financial",
        data: groupedTransactionValues,
        domainFn: (BarChartModel series, _) => series.day.substring(0, 6),
        measureFn: (BarChartModel series, _) => series.amount,
        colorFn: (BarChartModel series, _) => series.color,
      ),
    ];

    return Column(
      children: [
        Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () async {
                      final selectedMonth = await showMonthPicker(
                        context: context,
                        initialDate: _selectedMonth ?? DateTime.now(),
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
       const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Expenses",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: const [
                    Text(
                      "Amount",
                    ),
                  ],
                ),
                AbsorbPointer(
                  absorbing: groupedTransactionValues.isEmpty,
                  child: LayoutBuilder(
                    builder: (context, constraint) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          width: constraint.maxWidth,
                          height: 400,
                          child: charts.BarChart(
                            behaviors: [
                              charts.SlidingViewport(),
                              charts.PanAndZoomBehavior()
                            ],
                            domainAxis: charts.OrdinalAxisSpec(
                              viewport: charts.OrdinalViewport('', 3),
                            ),
                            series,
                            animate: true,
                            defaultRenderer: charts.BarRendererConfig(
                              maxBarWidthPx: 40,
                            ),
                          ),
                        ),
                      );
                    }
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      "Date",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
