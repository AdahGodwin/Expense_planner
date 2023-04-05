import 'package:expense_planner/providers/expense_provider.dart';
import 'package:expense_planner/providers/income_provider.dart';
import 'package:expense_planner/widgets/charts/expense_chart.dart';
import 'package:expense_planner/widgets/charts/income_chart.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({super.key, this.openDrawer, this.isDrawerOpen});
  final VoidCallback? openDrawer;
  final bool? isDrawerOpen;

  @override
  Widget build(BuildContext context) {
    List<Expense> expense = Provider.of<Expenses>(context).allExpenses;
    List<IncomeItem> income = Provider.of<Income>(context).allIncome;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Charts"),
        elevation: 0,
        backgroundColor: isDrawerOpen!
            ? Theme.of(context).primaryColorDark
            : Theme.of(context).primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed:openDrawer,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
                ExpenseChart(
                  expenses: expense,
                 ),
              const SizedBox(
                height: 30,
              ),
                IncomeChart(
                  income: income,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
