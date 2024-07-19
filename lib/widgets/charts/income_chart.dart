import 'package:collection/collection.dart';
import 'package:expense_manager/providers/income_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/bar_chart_model.dart';

class IncomeChart extends StatefulWidget {
  final List<IncomeItem> income;
  const IncomeChart({required this.income, super.key});

  @override
  State<IncomeChart> createState() => _IncomeChartState();
}

class _IncomeChartState extends State<IncomeChart> {
  DateTime? _selectedMonth;

  List<BarChartModel> get groupedTransactionValues {
    List<BarChartModel> grouptx = [];
    String key = _selectedMonth == null
        ? ".."
        : DateFormat("MM/yy").format(_selectedMonth!);

    List<IncomeItem> filteredTx = widget.income
        .where(
          (income) => income.key.contains(key),
        )
        .toList();
    if (filteredTx.isEmpty) {
      return [];
    }
    var groupedIncome = groupBy(
        filteredTx.sorted((a, b) => a.date.compareTo(b.date)),
        (obj) => obj.key);

    groupedIncome.forEach((day, income) {
      double totalSum = income.fold(0.0, (sum, item) {
        return sum + item.amount;
      });

      grouptx
          .add(BarChartModel(day: day, amount: totalSum, color: Colors.pink));
    });
    return grouptx;
  }

  @override
  Widget build(BuildContext context) {
    // List<charts.Series<BarChartModel, String>> series = [
    //   charts.Series(
    //     id: "Income",
    //     data: groupedTransactionValues,
    //     domainFn: (BarChartModel series, _) => series.day.substring(0, 6),
    //     measureFn: (BarChartModel series, _) => series.amount,
    //     colorFn: (BarChartModel series, _) => series.color,
    //   ),
    // ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                // final selectedMonth = await showMonthPicker(
                //   context: context,
                //   initialDate: _selectedMonth ?? DateTime.now(),
                //   firstDate: DateTime(2021),
                //   lastDate: DateTime.now(),
                // );
                // if (selectedMonth == null) {
                //   return;
                // }
                // setState(() {
                //   _selectedMonth = selectedMonth;
                // });
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
            "Income",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Amount",
                    ),
                  ],
                ),
                // AbsorbPointer(
                //   absorbing: groupedTransactionValues.isEmpty,
                //   child: LayoutBuilder(builder: (context, constraint) {
                //     return SingleChildScrollView(
                //       scrollDirection: Axis.horizontal,
                //       child: SizedBox(
                //         width: constraint.maxWidth,
                //         height: 400,
                //         child: charts.BarChart(
                //           behaviors: [
                //             charts.SlidingViewport(),
                //             charts.PanAndZoomBehavior()
                //           ],
                //           domainAxis: charts.OrdinalAxisSpec(
                //             viewport: charts.OrdinalViewport('', 3),
                //           ),
                //           series,
                //           animate: true,
                //           defaultRenderer: charts.BarRendererConfig(
                //             maxBarWidthPx: 40,
                //           ),
                //         ),
                //       ),
                //     );
                //   }),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
